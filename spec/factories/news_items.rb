FactoryGirl.define do
  factory :news_item do
    sequence(:title) { |n| "my-news-item-title-#{n}" }
    sequence(:body) { |n| "my-news-item-body-#{n}" }
    state "draft"
    published_at { Time.now.utc }
  end
end
