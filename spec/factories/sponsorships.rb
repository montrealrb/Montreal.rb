# frozen_string_literal: true
FactoryGirl.define do
  factory :sponsorship do
    association :event
    association :organization
  end
end
