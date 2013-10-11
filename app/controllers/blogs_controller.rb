class BlogsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def new
    @blog = Blog.new
  end

  def create
    url = blog_params[:url]
    @blog = Blog.blog_from_url(url)
    if @blog.save
      FeedEntry.update_from_feed(@blog)
      redirect_to root_path, notice: "#{@blog.title} has been added to your feed."
    else
      render 'new'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:url, category_ids:[])
  end
end
