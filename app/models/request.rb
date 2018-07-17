class Request < ApplicationRecord
  belongs_to :user
  validates :name_book, presence: true
  enum status: {progress: 0, done: 1}

  scope :by_user, -> user_id {where user_id: user_id}
  scope :ordered, -> {order created_at: :desc}
end
