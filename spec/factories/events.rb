FactoryGirl.define do
  factory :event do
    title "event title"
    body "event content"
    location
    starts_at Time.zone.now
  end
end
