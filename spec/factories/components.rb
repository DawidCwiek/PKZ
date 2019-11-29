FactoryBot.define do
  factory :component do
    name { Faker::Food.ingredient }
    quantity { Faker::Number.number(digits: 2) }
    cost { Faker::Number.decimal(l_digits: 2) }
  end
end
