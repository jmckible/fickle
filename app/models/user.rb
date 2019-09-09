class User < ApplicationRecord
  has_secure_password

  has_many :caucuses
  has_many :ballots
  has_many :created_polls, class_name: 'Poll', foreign_key: 'creator_id'

  has_many :polls,   through: :caucuses
  has_many :choices, through: :polls

  def name
    "#{first_name} #{last_name}"
  end

  validates :first_name, :last_name, :email, presence: true
end
