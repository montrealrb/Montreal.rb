# This will guess the User class
FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "password123"
  end
end