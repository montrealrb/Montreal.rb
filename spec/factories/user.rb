# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"
    admin false
  end

  factory :admin, class: User do
    email "admin@example.com"
    password "password"
    admin true
  end
end
