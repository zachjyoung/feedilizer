class FeedEntry < ActiveRecord::Base

  include ActionView::Helpers::TextHelper

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :name          => entry.title,
          :summary       => entry_summary(entry),
          :url           => entry.url,
          :published_at  => entry.published,
          :guid          => entry.id
        )
      end
    end
  end

  def self.entry_summary(entry)
    if entry.summary.present?
      return entry.summary
    elsif entry.description.present?
      return entry.description
    elsif entry.content.present?
      return entry.content.truncate(length: 250, separator: ' ')
    else
      return ""
    end
  end
end
