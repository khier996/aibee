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
    authorize @user
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email,:first_name, :last_name, :bio, :gender, :phone_number, :birthdate, :wechat_id)
  end
end
