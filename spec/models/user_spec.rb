require "rails_helper"
RSpec.describe User, type: :model do

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:activation_digest).of_type(:text) }
      it { should have_db_column(:password_digest).of_type(:text) }
      it { should have_db_column(:avatar).of_type(:string) }
      it { should have_db_column(:created_at).of_type(:datetime) }
      it { should have_db_column(:updated_at).of_type(:datetime) }
      it { should have_db_column(:activated).of_type(:boolean) }
    end
  end

  describe "validations" do
    it {is_expected.to validate_presence_of :name }
    it {is_expected.to validate_presence_of :email }
    it {is_expected.to validate_confirmation_of :password }
    it {is_expected.to validate_length_of(:phone).is_at_most 11 }
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
    let!(:user1) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true)}
    context "like by name email" do
      it do
        expect(User.like_by_name_email "Long123").to eq [user1]
      end
    end
  end

  describe ".admin" do
    let!(:user1) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    context "admin" do
      it do
        expect(User.admin).to include(user1)
      end
    end
  end

  describe "follow" do
    let!(:user1) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    let!(:user2) {FactoryBot.create(:user, name: "Nguyen", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    context "follow" do
      it do
        expect(user1.follow user2).to eq [user2]
      end
    end
  end

  describe "following" do
    let!(:user1) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    let!(:user2) {FactoryBot.create(:user, name: "Nguyen", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    context "following?" do
      it do
        expect(user1.following? user2).to eq false
      end
    end
  end

  describe "activate" do
    let!(:user1) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: true)}
    let!(:user2) {FactoryBot.create(:user, name: "Long123", 
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", activated: true, admin: false)}

    context "user activated" do
      it do
        expect(user1.activate).to eq true
      end
    end
  end
end
