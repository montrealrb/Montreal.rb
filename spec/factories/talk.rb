# This will guess the User class
FactoryGirl.define do
  factory :talk do
    author {build(:user)}
  end
end