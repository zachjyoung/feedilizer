# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed_entry do
    name "MyString"
    summary "MyText"
    url "MyString"
    published_at "2013-10-08 17:10:12"
    guid "MyString"
  end
end
