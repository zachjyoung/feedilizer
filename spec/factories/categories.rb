FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "The awesome blog ##{n}" }
    user User.new
  end
end
