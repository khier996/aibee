class UsersController < ApplicationController
  def show
    @current = current_user
    authorize @current
  end

  def edit
    @current = current_user
    authorize @current
  end
end
