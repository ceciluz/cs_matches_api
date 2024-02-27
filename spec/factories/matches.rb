# frozen_string_literal: true

FactoryBot.define do

  factory :match do

    team_home_score { 1 }
    team_away_score { 1 }
    team_away_id { 1 }
    team_home_id { 2 }

  end
end
