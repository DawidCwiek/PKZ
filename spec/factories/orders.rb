FactoryBot.define do
  factory :order do
    total_price { Faker::Number.decimal(l_digits: 2) }
    profit { Faker::Number.decimal(l_digits: 2) }
    store
  end
end
