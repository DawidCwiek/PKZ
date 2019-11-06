FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Crypto.md5 }
    password_confirmation { password }
  end
end
