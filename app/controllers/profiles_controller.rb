class ProfilesController < ApplicationController

def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user

    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
  end
end
