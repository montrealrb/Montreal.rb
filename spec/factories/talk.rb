FactoryGirl.define do
  factory :talk do
    title Faker::Book.title
    description Faker::Lorem.sentence
    state "proposed"
    level "beginner"
    slides_url Faker::Internet.url
    event
  end
end
