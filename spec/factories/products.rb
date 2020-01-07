require 'open-uri'

FactoryBot.define do
  factory :product do
    name { Faker::Restaurant.name }
    price { Faker::Number.decimal(l_digits: 2) }
    central
    after(:build) do |product|
      product.image.attach(io: open("https://homepages.cae.wisc.edu/~ece533/images/airplane.png"), filename: 'soy.jpeg', content_type: 'image/jpeg')
      # product.image.attach(io: open(Faker::Avatar.image), filename: 'soy.jpeg', content_type: 'image/jpeg')
    end
  end
end
