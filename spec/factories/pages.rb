# frozen_string_literal: true
FactoryGirl.define do
  factory :page do
    state { Page::STATES.sample }

    # Translatable:
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }

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
