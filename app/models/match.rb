class Match < ApplicationRecord

  validates :team_home_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :team_away_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :team_home
  belongs_to :team_away
  has_many :player_performance
end
