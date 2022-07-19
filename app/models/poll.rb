class Poll < ApplicationRecord
  include Slug

  belongs_to :creator, class_name: 'User'

  has_many :ballots
  has_many :caucuses
  has_many :choices

  has_many :users, through: :caucuses

  scope :live, -> { where(live: true) }

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
