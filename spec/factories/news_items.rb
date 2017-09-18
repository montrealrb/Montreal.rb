# frozen_string_literal: true

FactoryGirl.define do
  # Default factory is a NewsItem that has just been published
  factory :news_item do
    association :author, factory: :user

    state { NewsItem::STATES.sample }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    published_at { Faker::Date.backward(60) }

    trait :draft do
      state :draft
      body { Faker::Lorem.paragraph }
      published_at nil
    end

    trait :published do
      state :published
      published_at { Faker::Date.backward(30) }
    end

    trait :archived do
      state :archived
      published_at { Faker::Date.backward(30) - 1.year }
    end

    trait :slugged do
      slug { Faker::Internet.slug }
    end
  end
end
