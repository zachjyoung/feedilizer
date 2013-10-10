class Blog < ActiveRecord::Base

  has_many :feed_entries, inverse_of: :blog

  def self.blog_from_url(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    blog = Blog.new
    blog.url = feed.url
    blog.title = feed.title
    blog
  end

end
