FactoryGirl.define do
  factory :talk do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    state { Talk::STATES.sample }
    level "beginner"
    slides_url { Faker::Internet.url }
    event
    member
  end
end
