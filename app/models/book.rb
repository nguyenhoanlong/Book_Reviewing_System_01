class Book < ApplicationRecord
  belongs_to :category
  has_many :user_books
  has_many :requests
  has_many :ratings
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum: 50}
  validates :author, presence: true
  validates :number_of_pages, presence: true, numericality: {only_integer: true}
  scope :list_book, -> {select(:id, :name, :created_at, :author, :category_id).
    includes(:category).order(created_at: :asc)}
  private

  def picture
    if picture.size > Settings.validate_size_image.megabytes
      errors.add(:picture, "File images more than 4MB")
    end
  end
end
