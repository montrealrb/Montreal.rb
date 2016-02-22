FactoryGirl.define do
  factory :event do
    association :location

    starts_at { Faker::Date.forward(14) }

    # Translatable:
    title { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence}
    conclusion { Faker::Lorem.paragraph }
  end
end
