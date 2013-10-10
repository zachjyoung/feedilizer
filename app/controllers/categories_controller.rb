class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_blog_path, notice: 'Category created.'
    else
      render :new
    end
  end


  def category_params
    params.require(:category).permit(:name)
  end
end

