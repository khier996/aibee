class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def about

  end

  def home
    @current_user = current_user
    @selected_hobbies = Hobby.all
    if current_user
      user_categories = current_user.categories
      @selected_hobbies = @selected_hobbies.each { |hobby| hobby.categories & user_categories != [] ? true : false }
      @selected_hobbies = @selected_hobbies.sort { |a,b| b.average_score <=> a.average_score }
    end
    @categories = Category.all
    # @hobby = HobbyCategory.all
    # @hobby = Hobby.find(params[:hobby_id])

    # @hobby = Category.joins(hobby_categories: [:category]).where('category_id LIKE ?', "1")

    # raise

  end


  def dashboard_guest
    @current_user = current_user
    @notifications = current_user.bookings.where(review: nil)
    @notifications = @notifications.select { |booking| booking.event.end_time < Time.now }

    @bookings = @current_user.bookings
    @future_bookings = @bookings.select { |booking| booking.event.end_time >= Time.now }
    @past_bookings = @bookings.select { |booking| booking.event.end_time <= Time.now }

  end

  def dashboard_host
    @events = current_user.requests
    @hobbies = current_user.hobbies
    # @hobby = request.find(params[:id])
  end
end


# @future_events = user.events.where("hobby.user_id != ? AND start_time <  ?", 11, Time.now.to_date)
