class Blog < ActiveRecord::Base

  require 'simple-rss'
  require 'open-uri'


  has_many :blog_entries, inverse_of: :blog
  has_many :blog_categorizations, inverse_of: :blog
  has_many :categories, through: :blog_categorizations, inverse_of: :blogs
  has_many :user_blogs, inverse_of: :blogs
  has_many :users, through: :user_blogs, inverse_of: :blogs

  validates :url, :format => URI::regexp(%w(http https))
  validates_presence_of :title
  validates_uniqueness_of :feed_url
  validates :feed_url, :format => URI::regexp(%w(http https))


  def self.blog_from_url(feed_url)
    feed = SimpleRSS.parse open(feed_url)
    blog = Blog.new
    blog.url = feed.channel.link
    blog.title = feed.channel.title
    blog.feed_url = feed_url
    blog
  end

  def update_from_feed
    feed = SimpleRSS.parse open(feed_url)
    BlogEntry.add_entries(feed.entries, id)
  end
end
