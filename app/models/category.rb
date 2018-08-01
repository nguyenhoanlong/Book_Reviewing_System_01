class Category < ApplicationRecord
  has_many :books
  scope :list, -> {select(:id, :title, :description).order(title: :asc)}
end
