require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:category1) {FactoryBot.create(:category)}
  let!(:book1) {FactoryBot.create(:book, name: "Đại Nam Nhất thông chí1", description: Faker::Lorem.paragraph(50),
    author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}
  let!(:book2) {FactoryBot.create(:book, name: "Lập trình C1", description: Faker::Lorem.paragraph(50),
    author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}

  describe "associations" do
    it {is_expected.to have_many :ratings}
    it {is_expected.to have_many :user_books}
    it {is_expected.to have_many :histories}
  end

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :description}
    it {is_expected.to validate_presence_of :author}
    it {is_expected.to validate_presence_of :number_of_pages}
    it {is_expected.to validate_numericality_of :number_of_pages}
  end

  describe "list_book" do
    it {expect(Book.list_book).to include(book1, book2)}
  end

  describe ".filter_book" do
    it {expect(Book.filter_book category1.id, "Lập trình C").to eq [book2]}
  end

  describe ".filter_by_category" do
    it {expect(Book.filter_by_category category1.id).to include(book1, book2)}
  end

  describe "ordered_by_create" do
    it{expect(Book.ordered).to eq [book1, book2]}
  end
end
