# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test@test#{n}.com" }
    password 'mallgoats'
  end
end
