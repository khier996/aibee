class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    @categories = params[:user][:categories]
    @categories.shift
    @categories.each do |category_id|
      UserCategory.create(category_id: category_id, user_id: current_user.id)
    end
  end

  def update
    super
  end
end
