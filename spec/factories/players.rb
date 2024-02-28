# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    nickname { Faker::Esport.player }
    nationality { Faker::Nation.nationality }
    birth_date { Faker::Date.between(from: '1994-09-23', to: '2004-09-25') }
    team
    trait :with_player_performances do
      after(:create) do |player|
        create_list(:player_performance, 3, player:)
      end
    end
  end
end
