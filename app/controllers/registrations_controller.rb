class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    if current_user
      @categories = params[:user][:categories]
      @categories.shift
      @categories.each do |category_id|
        UserCategory.create(category_id: category_id, user_id: current_user.id)
      end
    end
  end

  def update
    super
  end
end
