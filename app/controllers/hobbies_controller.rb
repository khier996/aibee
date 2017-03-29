class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:show, :edit, :destroy]

  def index
    @hobbies = policy_scope(Hobby).order(created_at: :desc)
  end

  def show
    authorize @hobby
    @events = @hobby.events
  end

  def new
    @hobby = Hobby.new
    @categories = Category.all
    authorize @hobby
  end

  def create
    @hobby = Hobby.new(hobby_params)
    authorize @hobby
    @hobby.user_id = current_user[:id]
    @hobby.review_count = @hobby.average_score = @hobby.likes = 0
    @hobby.deleted = @hobby.hidden = false


    if @hobby.save
      params[:hobby][:categories][1..-1].each { |category_id| HobbyCategory.create(category_id: category_id, hobby_id: @hobby.id) }
      redirect_to hobby_path(@hobby)
    else
      render :new
    end
  end

  def edit
    authorize @hobby
  end

  def destroy
    authorize @hobby
    @hobby.deleted = @hobby.hidden = true
    @hobby.save

    redirect_to '/'
  end


  private

  def set_hobby
    @hobby = Hobby.find(params[:id])
  end

  def hobby_params
    params.require('hobby').permit(:title, :description, :summary, :address, photos: [])
  end
end
