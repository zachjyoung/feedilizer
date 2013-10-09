class FeedEntry < ActiveRecord::Base
  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  private

  def self.add_entries(feeds)
#        :title         => feed.title,
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :name          => entry.title,
          :summary       => entry.summary,
          :url           => entry.url,
          :published_at  => entry.published,
          :guid          => entry.id
        )
      end
    end
  end
end



