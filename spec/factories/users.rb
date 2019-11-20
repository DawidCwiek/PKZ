FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Crypto.md5 }
    password_confirmation { password }
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
