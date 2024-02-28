# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { 'MyString' }
    nickname { 'MyString' }
    nationality { 'MyString' }
    birth_date { '2004-02-26' }
    team factory: :team

    trait :with_player_performances do
      after(:create) do |player|
        create_list(:player_performance, 3, player: player)
      end
    end
  end
end
