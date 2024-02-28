# frozen_string_literal: true

class Match < ApplicationRecord
  validates :team_home_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :team_away_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :player_performances, class_name: 'PlayerPerformance', dependent: :destroy
  belongs_to :team_home, class_name: 'Team', inverse_of: :matches_as_home_team
  belongs_to :team_away, class_name: 'Team', inverse_of: :matches_as_away_team
  accepts_nested_attributes_for :player_performances

  def match_name
    "#{team_home.name} x #{team_away.name}"
  end

  def win?
    team_home_score > team_away_score
  end
end
