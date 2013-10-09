require 'spec_helper'

describe Blog do
  it { should have_valid(:url).when("http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml") } 
  it { should_not have_valid(:url).when("http://google.com", "", nil, "to Wong Foo") }

  it { should have_valid(:title).when("Awesome Blog") } 
  it { should_not have_valid(:title).when("", nil) }

  it { should have_many(:feed_entries) }
end
