# frozen_string_literal: true

FactoryGirl.define do
  factory :member do
    name "MyString"
    email { Faker::Internet.email }
    picture ""
    twitter_handle "MyString"
    github_handle "MyString"
    biography "MyText"
  end
end
