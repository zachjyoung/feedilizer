class BlogEntriesController < ApplicationController

  def index
    if user_signed_in?
      @blog_entries = current_user.blog_entries("published_at DESC")
    end
  end

end
