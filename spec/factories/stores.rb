FactoryBot.define do
  factory :store do
    name { Faker::Restaurant.name }
    central
    after(:build) do |store|
      store.address = FactoryBot.create(:address, addressable:store)
    end
  end
end
