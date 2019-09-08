class Choice < ApplicationRecord
  belongs_to :poll

  scope :abc,  -> { order(name: :asc) }
  scope :live, -> { where(live: true) }

  validates :name, presence: true, uniqueness: { scope: :poll_id }
end
