FactoryBot.define do
  factory :match do
    team_home_score { 1 }
    team_away_score { 1 }
    home_team_id { 1 }
    away_team_id { 2 }
  end
end
