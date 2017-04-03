class UsersController < ApplicationController
 def show
    @user = current_user
    authorize @user
  end

  def edit
    @current = current_user
    authorize @current
  end

end
