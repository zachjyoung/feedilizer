class BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def create
    url = blog_params[:url]
    @blog = Blog.blog_from_url(url)
    if @blog.save
      redirect_to root_path, notice: "#{@blog.title} has been added to your feed."
    else
      render 'new'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:url)
  end
end
