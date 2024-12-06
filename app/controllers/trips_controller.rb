class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    trip_success = initalize_trip(params[:station_id].to_i, params[:bike_id].to_i, current_user.id)
    unless trip_success == nil
      if @trip.save 
        redirect_to trips_path
      end
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end

 # this method should display all of the trips a user has taken
  def index
  end

 # displays a singular trip
  def show
  end

# Allows the user to end a trip through a button or a form
  def edit
  end

# handles the return bike cause this updates the trip
  def update
  end

  def initalize_trip(start_station_id, bike_used_id, user_id)
    #validate bike, station & customer
    unless Bike.exists?(bike_used_id)
      puts "No bike w/ id"
      return nil
    end
    unless Station.exits?(start_station_id)
      puts "No station w/ id"
      return nil
    end
    unless User.exists?(start_station_id)
      puts "No user w/ id"
      return nil
    end

    bike_used = Bike.find(bike_used_id)
    start_station = Station.find(start_station_id)
    user = User.find(user_id)

    #check bike @ station
    if bike_used.current_station == start_station
      #figure out start time
      #start_time = time_in_minutes

      #find next id
      id = Trip.maximum(:id).next

      #set variables trip
      # trip = Trip.create(id: id, identifier: id, start_time: start_time, start_station_id: start_station_id, bike_used_id: bike_used_id, customer_id: customer_id)
      @trip.id = id
      @trip.start_station = start_station
      @trip.bike_used = bike_used
      @trip.user = user_id

      #checkout bike
      bike_used.current_station = nil
      bike_used.save

      # return trip
      return trip
    end

    #only reachable if bike !@ station
    puts "Bike not at station"
    nil
  end

  def end_trip(trip_id, end_station_id)
    #valitade trip & station
    unless real_trip_id?(trip_id)
      puts "No trip w/ id"
      return nil
    end
    unless real_station_id?(end_station_id)
      puts "No station w/ id"
      return nil
    end

    trip = Trip.find(trip_id)

    #set end station
    end_station = Station.find(end_station_id)
    trip.end_station = end_station

    #set end time
    trip.end_time = time_in_minutes
    trip.save

    #check in bike
    bike_used = trip.bike_used
    bike_used.current_station = end_station
    bike_used.save

    #return trip
    trip
  end

  #returns the number of minutes elapsed since the start of the current day.
  def time_in_minutes
    time = Time.new
    hours_elapsed = time.strftime("%k").to_i
    puts hours_elapsed
    minutes_elapsed = time.strftime("%M").to_i
    puts minutes_elapsed
    (hours_elapsed * 60) + minutes_elapsed
  end

end