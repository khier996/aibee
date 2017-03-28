class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:show, :edit]

  def index
    @hobbies = policy_scope(Hobby).order(created_at: :desc)
  end

  def show
    authorize @hobby
  end

  def new
    @hobby = Hobby.new
    authorize @hobby
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user[:id]
    @hobby.review_count = 0
    @hobby.average_score = 0
    @hobby.likes = 0

    authorize @hobby
    @hobby.save

    redirect_to hobby_path(@hobby)
  end

  def edit
    authorize @hobby
  end


  private

  def set_hobby
    @hobby = Hobby.find(params[:id])
  end

  def hobby_params
    params.require('hobby').permit(:title, :description, :summary, :address)
  end
end
