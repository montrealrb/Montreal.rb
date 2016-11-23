# frozen_string_literal: true
FactoryGirl.define do
  factory :job do
    association :organization
    association :author, factory: :user

    state { Job::STATES.sample }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }

    trait :draft do
      state :draft
    end

    trait :published do
      state :published
    end

    trait :archived do
      state :archived
    end
  end
end
