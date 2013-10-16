# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    sequence(:url) { |n| "http://www.nytimes.com/services/xml/rss/nyt/#{n}JobMarket.html" }
    title "NYT &gt; Jobs"
    feed_url "http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml"

    factory :blog_with_entries do
      ignore do
        blog_entries_count 5
      end

      after(:create) do |blog, evaluator|
        FactoryGirl.create_list(:blog_entry, evaluator.blog_entries_count, blog: blog)
      end
    end
  end
end
