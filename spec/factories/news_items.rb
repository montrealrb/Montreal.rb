FactoryGirl.define do
  # Default factory is a NewsItem that has just been published
  factory :news_item do
    state :published
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    published_at Time.now.utc

    factory :draft_news_item do
      state :draft
      body { Faker::Lorem.paragraph }
      published_at nil
    end

    factory :archived_news_item do
      state :archived
      published_at { 1.year.ago }
    end

    factory :slugged_news_item do
      slug { Faker::Internet.slug }
    end

    factory :invalid_news_item do
      title nil
      state nil
    end
  end
end
