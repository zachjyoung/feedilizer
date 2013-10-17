class BlogEntriesController < ApplicationController

  def index
    if user_signed_in?
      @blog_entries = current_user.blog_entries.order("published_at DESC")
    end
  end

end
