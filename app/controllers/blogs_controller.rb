class BlogsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def new
    @blog = Blog.new
  end

  def create
    url = blog_params[:url]
    if Blog.where(feed_url: url).present?
      @blog = Blog.where(feed_url: url).first
    else
      @blog = Blog.blog_from_url(url)
      if @blog.save
        BlogEntry.update_from_feed(@blog)
      else
        render 'new'
      end
    end
    unless current_user.blogs.include?(@blog) 
      UserBlog.create(user_id: current_user.id, blog_id: @blog.id)    
    end
    redirect_to blog_entries_path, notice: "#{@blog.title} has been added to your feed."
  end

  private

  def blog_params
    params.require(:blog).permit(:url, category_ids:[])
  end
end
