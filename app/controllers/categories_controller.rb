class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @hobbies = @category.hobbies
    authorize @category
  end

end
