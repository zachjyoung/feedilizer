class BlogsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def new
    @blog = Blog.new
  end

  def create
    url = blog_params[:url]
    blog = Blog.where(feed_url: url).first
    if current_user.blogs.include?(blog)
      redirect_to blog_entries_path, notice: "You already subscribe to #{blog.title}"
    else
      if blog.present?
        @blog = blog
      else
        @blog = Blog.blog_from_url(url)
        if @blog.save
          UpdateBlogFeedWorker.perform_async(@blog.id)
        else
          render 'new'
        end
      end
    UserBlog.create(user: current_user, blog: @blog)
    redirect_to blog_entries_path, notice: "#{@blog.title} has been added to your feed."
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
    params.require(:blog).permit(:url, category_ids:[])
  end
end
