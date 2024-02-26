class Team < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  validates :region, presence: true

  has_many :players
  has_many :matches_as_home
  has_many :matches_as_away
end
