# frozen_string_literal: true

FactoryBot.define do

  factory :player do

    name { 'MyString' }
    nickname { 'MyString' }
    nationality { 'MyString' }
    birth_date { '2004-02-26' }
    team_id { 1 }

    association :team
  end
end
