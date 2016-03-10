FactoryGirl.define do
  factory :event do
    association :location
    association :author, factory: :user

    starts_at { Faker::Date.between(30.days.ago, 30.days.from_now) }

    # Translatable:
    title { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence }
    conclusion { Faker::Lorem.paragraph }

    trait :proposed do
      state "proposed"
    end

    trait :scheduled do
      state "scheduled"
    end
  end
end
