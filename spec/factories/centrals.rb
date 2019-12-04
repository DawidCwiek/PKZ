FactoryBot.define do
  factory :central do
    after(:create) do |central|
      central.address = FactoryBot.create(:address, addressable:central)
    end
  end
end
