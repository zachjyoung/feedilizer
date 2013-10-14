class Blog < ActiveRecord::Base
  require 'simple-rss'
  require 'open-uri'
 
  has_many :feed_entries, inverse_of: :blog 
  has_many :blog_categorizations, inverse_of: :blog
  has_many :categories, through: :blog_categorizations, inverse_of: :blogs

  validates :url, :format => URI::regexp(%w(http https))
  validates_presence_of :title
  validates_uniqueness_of :url

  def self.blog_from_url(feed_url)
    feed = SimpleRSS.parse open(feed_url)
    blog = Blog.new
    blog.url = feed.channel.link
    blog.title = view_context.html_safe(feed.channel.title)
    blog.feed_url = feed_url
    blog
  end
end
