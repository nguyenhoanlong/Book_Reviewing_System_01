class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :rating
  validates :content, presence: true
  scope :ordered, -> {order(created_at: :desc)}
end
