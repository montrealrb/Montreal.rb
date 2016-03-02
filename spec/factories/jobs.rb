FactoryGirl.define do
  factory :job do
    association :organization

    state { Job::STATES.sample }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    trait :draft do
      state :draft
      title nil
      description nil
    end

    trait :published do
      state :published
    end

    trait :archived do
      state :archived
    end
  end
end
