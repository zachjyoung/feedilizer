require 'spec_helper'

describe FeedEntry do
  it { should have_valid(:guid).when("http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml", "11") }
  it { should_not have_valid(:guid).when("", nil) }

  it { should have_valid(:url).when("http://www.nytimes.com/services/xml/rss/nyt/JobMarket.html") }
  it { should_not have_valid(:url).when("", nil, "gaga@gaga.com", "http") }

  it { should have_valid(:published_at).when(Date.today) }
  it { should_not have_valid(:published_at).when("", nil) }

  it { should have_valid(:name).when("Oh my god this thing!", "I hate the MBTA") }
  it { should_not have_valid(:name).when("", nil) }

  it { should belong_to(:blog) }
end
