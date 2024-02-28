# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    team_home_score { 1 }
    team_away_score { 1 }
    team_away factory: :team
    team_home factory: :team
  end
end
