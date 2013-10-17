class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    if user_signed_in?
      @categories = current_user.categories
    end
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to new_blog_path, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @category = current_user.categories.find(params[:id])
    @blog_entries = @category.blog_entries.order("published_at DESC")
  end

  def edit
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to blogs_path
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
