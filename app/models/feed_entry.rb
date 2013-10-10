class FeedEntry < ActiveRecord::Base

  include ActionView::Helpers::TextHelper

  belongs_to :blog, inverse_of: :feed_entries

  validates_presence_of :name
  validates_presence_of :guid
  validates_presence_of :published_at

  validates :url, :format => URI::regexp(%w(http https))

  def self.update_from_feed(blog)
    feed = Feedzirra::Feed.fetch_and_parse(blog.feed_url)
    add_entries(feed.entries, blog.id)
  end

  def self.update_from_feed_continuously(blog, delay_interval = 1.minutes)
    feed = Feedzirra::Feed.fetch_and_parse(blog.feed_url)
    add_entries(feed.entries, blog.id)
    loop do
      sleep delay_interval
      feed = Feedzirra::Feed.update(feed)
      add_entries(feed.new_entries, blog.id) if feed.updated?
    end
  end

  private

  def self.add_entries(entries, blog_id)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :name         => entry.title,
          :summary       => entry_summary(entry),
          :url           => entry.url,
          :published_at  => entry.published,
          :guid          => entry.id,
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

