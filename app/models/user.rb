class User < ApplicationRecord
  has_many :ratings
  has_many :user_books
  has_many :requests
  has_many :likes
  has_many :histories, class_name: "Relationship", foreign_key: "user_id"
  has_many :histories, as: :historyable
  has_many :comments
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_secure_password
  scope :like_by_name_email, -> (keyword){where("name like ? or email like ?",
    "%#{keyword}%", "%#{keyword}%")}
  scope :ordered, -> {order(name: :desc)}
  scope :admin, -> {where(admin: Settings.role_admin)}
  scope :by_comment_ratings, ->(rating_id, curren_user_id){select(:email, :name).distinct.left_outer_joins(:comments)
                              .where("comments.rating_id = #{rating_id} and users.id != #{curren_user_id}")}
  mount_uploader :avatar, ImageUploader

  attr_accessor :activation_token

  before_create :create_activation_digest

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :phone, length: {maximum: Settings.maximum_phone}

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attributes activated: true
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  private

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
