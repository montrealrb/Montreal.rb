# frozen_string_literal: true

FactoryGirl.define do
  factory :organization do
    name { Faker::Company.name }
    address do
      "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}"
    end
    logo { Faker::Company.logo }

    # Translatable:
    description { Faker::Lorem.paragraph }
  end
end
