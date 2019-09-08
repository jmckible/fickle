class Ballot < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  has_many :rankings, -> { order(position: :asc) }

  scope :for, ->(poll){ where(poll: poll) }
  scope :newest_first, -> { order(created_at: :desc) }
end
