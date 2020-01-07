FactoryBot.define do
  factory :menu do
    name { Faker::Restaurant.name  }
    active { false }
    central
    after :create do |menu|
      create_list :product, 2, central_id: menu.central.id
    end
  end
end
