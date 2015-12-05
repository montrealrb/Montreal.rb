FactoryGirl.define do
  factory :job do
    state "draft"
    sequence(:title) { |n| "MyJobTitle#{n}" }
    sequence(:description) { |n| "MyJobDescription#{n}" }
    organization_id 1
  end
end
