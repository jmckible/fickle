class Poll < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :ballots
  has_many :choices

  def to_param
    slug
  end

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
