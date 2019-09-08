class Ranking < ApplicationRecord
  belongs_to :ballot
  belongs_to :choice
end
