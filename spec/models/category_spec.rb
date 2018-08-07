require "rails_helper"

RSpec.describe Category, type: :model do
  let!(:category1) {FactoryBot.create(:category)}

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:title).of_type(:string) }
      it { should have_db_column(:description).of_type(:text) }
    end
  end

  describe "validations" do
    it {is_expected.to validate_presence_of :title }
  end

  context "associations" do
    it {is_expected.to have_many :books}
  end

  describe ".by_title" do
    let!(:category1) {FactoryBot.create(:category)}
    let!(:category2) {FactoryBot.create(:category, title: "Tin học văn phòng", description: Faker::Lorem.paragraph)}
    let!(:category3) {FactoryBot.create(:category, title: "Viễn tưởng", description: Faker::Lorem.paragraph)}
    context "found category" do
      it do
        expect(Category.by_title "Tin học").to eq [category1, category2]
      end
    end
  end
end
