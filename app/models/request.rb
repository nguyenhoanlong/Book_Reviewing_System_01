class Request < ApplicationRecord
  belongs_to :user
  validates :name_book, presence: true
  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :by_user, -> user_id {where user_id: user_id}
  scope :ordered, -> {order created_at: :desc}

  class << self
    def remove_request_accepted
      request_accepted = self.approved
      request_accepted.destroy_all unless request_accepted.nil? 
    end
  end
end
