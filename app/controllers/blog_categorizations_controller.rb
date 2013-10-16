class BlogCategorizationsController < ApplicationController
  def destroy
    @blog_categorization = BlogCategorization.where(params[:category_id, :blog_id])
    @category.destroy
    redirect_to blogs_path
  end

  def update
    respond_to do |format|
      if @blog_categorization.update(blog_categorization_params)
        format.html { redirect_to blogs_path, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog_categorization.errors, status: :unprocessable_entity }
      end
    end
  end
end
