# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    url "http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml"
    title "NYT > Jobs"
  end
end
