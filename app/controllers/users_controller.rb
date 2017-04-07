class UsersController < ApplicationController
 def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @current = current_user
    authorize @current
  end
end
