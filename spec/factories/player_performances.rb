FactoryBot.define do
  factory :player_performance do
    kills { 1 }
    assists { 1 }
    deaths { 1 }
    headshots { 1 }
    player { nil }
    match { nil }
  end
end
