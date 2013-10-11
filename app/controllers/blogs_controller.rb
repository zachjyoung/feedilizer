class BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def create
    #url = blog_params[:url]
    @blog = Blog.blog_from_url(blog_params[:url], blog_params)
    if @blog.save
      redirect_to root_path, notice: "#{@blog.title} has been added to your feed."
    else
      render 'new'
    end
  end

  def index
    @blogs = Blog.all
  end

  def show

  end

  def edit

  end

  private

  def blog_params
    params.require(:blog).permit(:url, category_ids: [])
  end
end
