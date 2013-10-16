require 'spec_helper'

describe Blog do
  it { should have_valid(:url).when("http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml") }
  it { should_not have_valid(:url).when("", nil) }

  it { should have_valid(:title).when("Awesome Blog") }
  it { should_not have_valid(:title).when("", nil) }

  it { should have_many(:blog_entries) }

  describe ".blog_from_url" do
    let(:feed_url) { "http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml" }
    it "creates a new blog from the feed url" do
      VCR.use_cassette('valid_feed') do 
        blog = Blog.blog_from_url(feed_url)
        expect(blog.title).to eq "NYT &gt; Jobs"
        expect(blog.url).to eq "http://www.nytimes.com/pages/jobs/index.html?partner=rss"
      end
    end
  end
end

