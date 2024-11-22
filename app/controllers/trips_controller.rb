class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    if @trip.save
      redirect_to trips_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end
end
