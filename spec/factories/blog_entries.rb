# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_entry do
    sequence(:name) { |n| "Entry name is #{n} you know" }
    summary "MyText"
    url "http://www.google.com"
    published_at "2013-10-08 17:10:12"
    sequence(:guid) { |n| "#{n}" } 
  end
end
