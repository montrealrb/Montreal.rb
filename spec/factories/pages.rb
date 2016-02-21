FactoryGirl.define do
  factory :page do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    state { [:draft, :published, :archived].sample }

    trait :draft do
      state :draft
    end

    trait :published do
      state :published
    end

    trait :archived do
      state :archived
    end
  end
end
