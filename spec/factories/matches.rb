# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    team_home_score { Faker::Number.between(from: 0, to: 150) }
    team_away_score { Faker::Number.between(from: 0, to: 150) }
    team_away factory: :team
    team_home factory: :team
  end
end
