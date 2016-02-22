FactoryGirl.define do
  factory :location do
    name { Faker::Company.name }
    address { Faker::Address.street_address + Faker::Address.city + Faker::Address.country }
    url { Faker::Internet.domain_name }

    # Translatable:
    description { Faker::Lorem.paragraph }
    directions { Faker::Lorem.paragraph }
  end
end
