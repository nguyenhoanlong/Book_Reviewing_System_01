class Book < ApplicationRecord
  belongs_to :category
  has_many :user_books
  has_many :requests
  has_many :ratings
  has_many :histories, as: :historyable
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum: 50}
  validates :author, presence: true
  validates :number_of_pages, presence: true, numericality: {only_integer: true}
  scope :list_book, -> {select(:id, :name, :created_at, :author, :category_id).
    includes(:category).order(created_at: :asc)}
  scope :like_by_name_author, -> (key_word){includes(:category).where("name like ? or author like ?", "%#{key_word}%", "%#{key_word}%")}
  scope :filter_book, -> (cat_id, key_word){includes(:category)
    .where("(name like ? or author like ?) and category_id = ?",
    "%#{key_word}%", "%#{key_word}%", "#{cat_id}").order(created_at: :asc)}
  scope :filter_by_category, -> (cat_id){includes(:category).where(category_id: cat_id)}
  scope :ordered, -> {order(created_at: :desc)}

  private

  def picture
    if picture.size > Settings.validate_size_image.megabytes
      errors.add :picture, (t "books.more_than")
    end
  end
end
