# frozen_string_literal: true
FactoryGirl.define do
  factory :contact do
    association :organization
    association :author, factory: :user

    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    note { Faker::Lorem.paragraph }
  end
end
