# frozen_string_literal: true

FactoryBot.define do
  factory :player_performance do
    kills { Faker::Number.between(from: 0, to: 50) }
    assists { Faker::Number.between(from: 0, to: 75) }
    deaths { Faker::Number.between(from: 0, to: 30) }
    headshots { Faker::Number.between(from: 0, to: 100) }
    player
    match factory: :match
  end
end
