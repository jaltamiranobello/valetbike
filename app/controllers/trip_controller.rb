class TripController < ApplicationController
  def index
    @trips = Trip.all.order(identifier: :desc)
  end

  def calculate_time
    get_current_trip 
    #calculates the trip length
    #I'm assuming this will result in the time in minutes
    @current_trip.start_time-@current_trip.end_time
  end

  def calculate_emmisions
    time_in_minutes = calculate_time
    milage = 0.25*time_in_minutes #calculates the milage assuming an average speed of 15mph or 0.25miles/minute
    411*milage #calculates the emmisions in grams of Co2 for the milage in an average car (produces 411gr per mile)
  end

  def get_current_trip
    # assigns @current_trip to the trip matching the id in params
    @current_trip = Trip.find(params[:trip_id].to_i)
  end
end
