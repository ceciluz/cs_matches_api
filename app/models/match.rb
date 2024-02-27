class Match < ApplicationRecord

  validates :team_home_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :team_away_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :player_performances, class_name: 'PlayerPerformance', dependent: :destroy
  belongs_to :home_team, class_name: 'Team', inverse_of: :matches_as_home_team
  belongs_to :away_team, class_name: 'Team', inverse_of: :matches_as_away_team
end
