# frozen_string_literal: true

FactoryBot.define do
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

    trait :published_without_published_at do
      state :published
      after(:create) { |job| job.update(published_at: nil) }
    end
  end
end
