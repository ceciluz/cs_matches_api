FactoryBot.define do
  factory :player do
    name { "MyString" }
    nickname { "MyString" }
    nationality { "MyString" }
    birth_date { "2024-02-26" }
    team { nil }
  end
end
