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
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
         redirect_to blogs_path, notice: 'Category was successfully updated.'
      else
         render action: 'edit'
      end
  end
  private

  def blog_params
    params.require(:blog).permit(:url, category_ids: [])
  end
end
