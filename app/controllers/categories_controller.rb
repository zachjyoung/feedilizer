class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
     if @category.save
        format.html { redirect_to new_blog_path, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.json { head :no_content }
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

