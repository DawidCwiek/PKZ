FactoryBot.define do
  factory :menu do
    name { Faker::Restaurant.name  }
    active { false }
    central
  end
end
