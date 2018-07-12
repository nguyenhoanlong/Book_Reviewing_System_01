class Book < ApplicationRecord
  belongs_to :category
  has_many :user_books
  has_many :requests
  has_many :ratings
end
