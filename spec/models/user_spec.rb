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
end
