# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    admin false

    trait :admin do
      admin true
    end
  end
end
