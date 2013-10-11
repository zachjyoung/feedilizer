FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "The awesome blog ##{n}" }
    association :user
  end
end
