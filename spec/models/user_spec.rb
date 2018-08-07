require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user1) {FactoryBot.create(:user, name: "Long123", 
    email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
  let!(:user2) {FactoryBot.create(:user, name: "Nguyen", 
    email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_confirmation_of :password}
    it {is_expected.to validate_length_of(:phone).is_at_most 11}
    it {is_expected.to validate_confirmation_of :password}
  end

  context "associations" do
    it {is_expected.to have_many :ratings}
    it {is_expected.to have_many :user_books}
    it {is_expected.to have_many :likes}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :following}
    it {is_expected.to have_many :followers}
  end

  describe ".like_by_name_email" do
    it {expect(User.like_by_name_email "Long123").to eq [user1]}
  end

  describe ".admin" do
    it {expect(User.admin).to include(user1)}
  end

  describe "follow" do
    it {expect(user1.follow user2).to eq [user2]}
  end

  describe "following" do
    context "following?" do
      it { expect(user1.following? user2).to eq false }
    end
  end

  describe "activate" do
    it {expect(user1.activate).to eq true}
  end
end
