# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    admin false
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password "password"
    admin true
  end
end
