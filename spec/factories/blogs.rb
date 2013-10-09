# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    url "MyString"
    summary "MyText"
    guid "MyString"
    published_at "2013-10-09 14:21:59"
    name "MyString"
  end
end
