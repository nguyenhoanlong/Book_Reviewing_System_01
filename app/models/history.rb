class History < ApplicationRecord
  belongs_to :user
  has_many :likes
  belongs_to :historyable, polymorphic: true
  scope :ordered, -> {order(created_at: :desc)}
  scope :by_following, -> (user){where(user_id: user.following)
    .or(where(user_id: user.id))}
  enum type_history: {mark: Settings.user_mark_book, follow: Settings.user_follow_other_user,
    review: Settings.rating_book}
end
