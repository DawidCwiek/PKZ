FactoryBot.define do
  factory :component do
    name { Faker::Food.ingredient }
    cost { Faker::Number.decimal(l_digits: 2) }
  end
end
