class Poll < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :ballots
  has_many :caucuses
  has_many :choices

  has_many :users, through: :caucuses

  scope :live, -> { where(live: true) }

  def to_param
    slug
  end

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
