FactoryGirl.define do
  factory :event do
    title { Faker::Book.title }
    introduction { Faker::Lorem.sentence }
    conclusion { Faker::Lorem.sentence }
    starts_at 10.days.from_now
    location
  end
end
