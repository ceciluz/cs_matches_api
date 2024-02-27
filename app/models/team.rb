class Team < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  validates :region, presence: true

  has_many :players, dependent: :destroy
  has_many :matches_as_home_team, class_name: 'Match', foreign_key: 'home_team_id', dependent: :destroy
  has_many :matches_as_away_team, class_name: 'Match', foreign_key: 'away_team_id', dependent: :destroy
end
