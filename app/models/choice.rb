class Choice < ApplicationRecord
  belongs_to :poll

  has_many :rankings, dependent: :destroy

  scope :abc,       -> { order(name: :asc) }
  scope :by_random, -> { order('RANDOM()') }
  scope :live,      -> { where(live: true) }

  validates :name, presence: true, uniqueness: { scope: :poll_id }
end
