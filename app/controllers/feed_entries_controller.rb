class FeedEntriesController < ApplicationController

  def index
    @feed_entries = FeedEntry.all.order("published_at DESC")
  end

end
