class Blog < ActiveRecord::Base
 
  has_many :feed_entries, inverse_of: :blog 
  has_many :blog_categorizations, inverse_of: :blog
  has_many :categories, through: :blog_categorizations, inverse_of: :blogs
  has_many :user_blogs, inverse_of: :blog
  has_many :users, through: :user_blogs, inverse_of: :blogs

  validates :url, :format => URI::regexp(%w(http https))
  validates_presence_of :title
  validates_uniqueness_of :url

  def self.blog_from_url(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    blog = Blog.new
    blog.url = feed.url
    blog.title = feed.title
    blog
  end

end
