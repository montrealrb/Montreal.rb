# frozen_string_literal: true

FactoryBot.define do
  factory :talk do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    state { Talk::STATES.sample }
    level "beginner"
    slides_url { Faker::Internet.url }
    event
    member
    youtube_id "s0gKePTF31U"
  end
end
