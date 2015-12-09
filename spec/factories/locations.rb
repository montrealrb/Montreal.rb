FactoryGirl.define do
  factory :location do
    name { Faker::Address.street_address }
  end
end
