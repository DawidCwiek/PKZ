FactoryBot.define do
  factory :quantity do
    quantity { Faker::Number.number(digits: 2) }
  end
end
