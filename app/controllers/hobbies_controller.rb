class HobbiesController < ApplicationController
  before_action :set_restaurant

  def create
    authorize @restaurant
  end
end
