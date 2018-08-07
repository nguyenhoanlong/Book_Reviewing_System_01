require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:category1) {FactoryBot.create(:category, title: "Việt Nam", description: Faker::Lorem.paragraph)}
  let!(:book1) {FactoryBot.create(:book, name: "Đại Nam Nhất thông chí", description: Faker::Lorem.paragraph(50),
    author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}
  let!(:book2) {FactoryBot.create(:book, name: "Lập trình C", description: Faker::Lorem.paragraph(50),
    author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:image).of_type(:string) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:author).of_type(:string) }
      it { should have_db_column(:number_of_pages).of_type(:integer) }
      it { should have_db_column(:category_id).of_type(:integer) }
      it { should have_db_column(:price).of_type(:float) }
      it { should have_db_column(:number_of_pages).of_type(:integer) }
      it { should have_db_column(:created_at).of_type(:datetime) }
      it { should have_db_column(:updated_at).of_type(:datetime) }
    end
  end

  describe "validations" do
    it {is_expected.to validate_presence_of :name }
    it {is_expected.to validate_presence_of :description }
    it {is_expected.to validate_presence_of :author }
    it {is_expected.to validate_presence_of :number_of_pages }
  end

  describe "associations" do
    it {is_expected.to have_many :ratings}
    it {is_expected.to have_many :user_books}
    it {is_expected.to have_many :histories}
  end

  describe ".like_by_name_author" do
    let!(:category1) {FactoryBot.create(:category)}
    let!(:category2) {FactoryBot.create(:category, title: "Việt Nam", description: Faker::Lorem.paragraph)}
    let!(:book1) {FactoryBot.create(:book, name: "Đại Nam Nhất thông chí", description: Faker::Lorem.paragraph(50),
      author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}
    let!(:book2) {FactoryBot.create(:book, name: "Lập trình C", description: Faker::Lorem.paragraph(50),
      author: Faker::Name.name, category_id: category1.id, number_of_pages: Faker::Number.number(3))}

    context "matching letters" do
      it do
        expect(Book.like_by_name_author "Đại Nam").to eq [book1]
      end
    end
  end

  describe ".filter_book" do
    context "search by category" do
      it do
        expect(Book.filter_book category1.id, "Lập trình C").to include(book2)
      end
    end
  end

  describe ".filter_by_category" do
    context "search by category" do
      it do
        expect(Book.filter_by_category category1.id).to include(book1, book2)
      end
    end
  end

  describe "ordered_by_create" do
    context "search by category" do
      it{expect(Book.ordered).to include(book2, book1)}
    end
  end
end
