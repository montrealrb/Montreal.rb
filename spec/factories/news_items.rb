FactoryGirl.define do
  factory :news_item do
    title "my-title"
    published_at Time.now.utc
  end
end
