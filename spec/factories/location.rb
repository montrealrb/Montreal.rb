FactoryGirl.define do
  factory :location do
    name { Faker::Address.street_name }
    address { Faker::Address.street_address }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    directions { Faker::Lorem.paragraph }
  end
end
