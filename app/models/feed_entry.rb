class FeedEntry < ActiveRecord::Base
require 'simple-rss'
require 'open-uri'

  include ActionView::Helpers::TextHelper

  belongs_to :blog, inverse_of: :feed_entries

  validates_presence_of :name
  validates_presence_of :guid
  validates_presence_of :published_at

  validates :url, :format => URI::regexp(%w(http https))

  def self.update_from_feed(blog)
    feed = SimpleRSS.parse open(blog.feed_url)
    add_entries(feed.entries, blog.id)
  end

  private

  def self.add_entries(entries, blog_id)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :name          => entry.title,
          :summary       => entry_summary(entry),
          :url           => entry.link,
          :published_at  => entry.pubDate,
          :guid          => entry.guid,
          :blog_id       => blog_id
        )
      end
    end
  end

  def self.entry_summary(entry)
    if entry.summary.present?
      return entry.summary
    elsif entry.content.present?
      return entry.content.truncate(250)
    else
      return ""
    end
  end
end

