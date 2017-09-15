# frozen_string_literal: true

# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    admin false

    association :member

    trait :admin do
      admin true
    end
  end
end
