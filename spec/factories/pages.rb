FactoryGirl.define do
  factory :page do
    state { [:draft, :published, :archived].sample }

    # Translatable:
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }

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
