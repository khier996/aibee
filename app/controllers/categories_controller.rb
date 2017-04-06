class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @hobbies = @category.hobbies
    authorize @category
    @hobbies_coordinates = @hobbies.map { |hobby| {lat: hobby.latitude, lng: hobby.longitude} if hobby.latitude && hobby.longitude }
    @hobbies_coordinates.reject! { |coord| coord == nil }
  end

end
