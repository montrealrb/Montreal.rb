FactoryGirl.define do
  factory :event do
    association :location

    starts_at { Faker::Date.between(30.days.ago, 30.days.from_now) }

    # Translatable:
    title { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence }
    conclusion { Faker::Lorem.paragraph }

    trait :upcoming do
      starts_at { Faker::Date.forward(14) }
    end

    trait :past do
      starts_at { Faker::Date.backward(14) }
    end
  end
end
