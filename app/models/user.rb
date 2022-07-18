class User < ApplicationRecord
  has_secure_password validations: false

  has_many :caucuses
  has_many :ballots
  has_many :created_polls, class_name: 'Poll', foreign_key: 'creator_id'

  has_many :polls,   through: :caucuses
  has_many :choices, through: :polls

  def name
    "#{first_name} #{last_name}"
  end

  def reminders_due(since: 16.hours.ago)
    [].tap do |due|
      polls.live.each do |poll|
        ballot = ballots.for(poll).newest_first.first
        if ballot.nil? || ballot.created_at < since
          due << poll
        end
      end
    end
  end

  validates :first_name, :last_name, :email, presence: true
end
