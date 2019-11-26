FactoryBot.define do
  factory :product do
    name { Faker::Restaurant.name }
    price { Faker::Number.decimal(l_digits: 2) }
    central
  end
end
