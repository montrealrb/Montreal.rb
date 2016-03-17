FactoryGirl.define do
  factory :event_sponsor do
    association :event
    association :organization
  end
end
