FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Device.serial }
  end
end
