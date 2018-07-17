class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: Settings.minimum_content_review}
  validates :poin, presence: true
  
  scope :by_book, -> (book_id){includes(:user).order(created_at: :asc)
    .where(book_id: book_id)}
end
