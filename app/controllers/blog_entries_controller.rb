class BlogEntriesController < ApplicationController

  def index
    # @blog_entries = BlogEntry.all.order("published_at DESC")
    @blog_entries = current_user.blog_entries("published_at DESC")
  end

end
