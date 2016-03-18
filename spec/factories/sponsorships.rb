FactoryGirl.define do
  factory :sponsorship do
    association :event
    association :organization
  end
end
