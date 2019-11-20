FactoryBot.define do
  factory :address do
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
  end
end
