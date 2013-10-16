# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    sequence(:url) { |n| "http://www.nytimes.com/services/xml/rss/nyt/#{n}JobMarket.html" }
    title "NYT &gt; Jobs"
    feed_url "http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml"
  end
end
