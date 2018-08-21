class Category < ApplicationRecord
  has_many :books
  validates_presence_of :title
  scope :list, -> {select(:id, :title, :description).order(title: :asc)}
  scope :by_title, ->(cat_name){select(:id, :title, :description).order(title: :asc)
    .where("title like ?", "%#{cat_name}%")}
end
