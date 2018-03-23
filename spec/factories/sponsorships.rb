# frozen_string_literal: true

FactoryBot.define do
  factory :sponsorship do
    association :event
    association :organization
  end
end
