# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Name.name }
    country { Faker::Address.country }
    region { Faker::Address.time_zone }
  end
end
