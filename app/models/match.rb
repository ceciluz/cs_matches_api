# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', inverse_of: :matches_as_home_team
  belongs_to :away_team, class_name: 'Team', inverse_of: :matches_as_away_team

  validates :team_home_score, :team_away_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :players_performances, class_name: 'PlayerPerformance', dependent: :destroy

end
