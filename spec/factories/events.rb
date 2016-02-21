FactoryGirl.define do
  factory :event do
    association :location

    title { Faker::Lorem.sentence }
    starts_at { Faker::Date.forward(14) }
  end
end
