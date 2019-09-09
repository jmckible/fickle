class Ballot < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  has_many :rankings, -> { order(position: :asc) }

  scope :for, ->(poll){ where(poll: poll) }
  scope :latest, -> { newest_first.first }
  scope :newest_first, -> { order(created_at: :desc) }
end
