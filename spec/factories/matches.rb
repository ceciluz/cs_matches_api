FactoryBot.define do
  factory :match do
    team_home_score { 1 }
    team_away_score { 1 }
    team_home { nil }
    team_away { nil }
  end
end
