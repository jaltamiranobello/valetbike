class TripController < ApplicationController
  helper_method :start_trip, :end_trip, :get_current_length_of_active_trip, :calculate_duration, :calculate_emmisions

  def index
    @trips = Trip.all.order(identifier: :desc)
  end

  def start_trip(start_station_id, bike_used_id, customer_id)
    #validate bike, station & customer
    unless real_bike_id?(bike_used_id)
      puts "No bike w/ id"
      return nil
    end
    unless real_station_id?(start_station_id)
      puts "No station w/ id"
      return nil
    end
    unless Customer.exists?(start_station_id)
      puts "No customer w/ id"
      return nil
    end

    bike_used = Bike.find(bike_used_id)
    start_station = Station.find(start_station_id)

    #check bike @ station
    if bike_used.current_station == start_station
      #figure out start time
      start_time = time_in_minutes

      #find next id
      id = Trip.maximum(:id).next

      #create trip
      trip = Trip.create(id: id, identifier: id, start_time: start_time, start_station_id: start_station_id, bike_used_id: bike_used_id, customer_id: customer_id)

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

  def get_current_length_of_active_trip(trip_id)
    #validate trip
    unless real_trip_id?(trip_id)
      puts "No trip w/ id"
      return nil
    end

    start_time = Trip.find(trip_id).start_time
    current_time = time_in_minutes
    diffrence_in_times(start_time, current_time)
  end

  def calculate_duration(trip_id)
    #validate trip
    unless real_trip_id?(trip_id)
      puts "No trip w/ id"
      return nil
    end

    trip = Trip.find(trip_id)
    diffrence_in_times(trip.start_time, trip.end_time)
  end

  def calculate_emmisions(trip_id)
    #validate trip
    unless real_trip_id?(trip_id)
      puts "No trip w/ id"
      return nil
    end

    time_in_minutes = calculate_duration(trip_id)
    milage = 0.25*time_in_minutes #calculates the milage assuming an average speed of 15mph or 0.25miles/minute
    411*milage #calculates the emmisions in grams of Co2 for the milage in an average car (produces 411gr per mile)
  end

  def trip_params
    params.expect(:trip_id, :station_id, :bike_id)
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

  #returns the diffrence in minutes between two times expressed as the number of minutes elapsed in the day. (asumes times are <24 apart)
  def diffrence_in_times(first_time, second_time)
    if first_time < second_time
      second_time - first_time
    else 
      second_time + 1440 - first_time
    end
  end

  def real_station_id?(station_id)
    Station.exists?(station_id)
  end

  def real_bike_id?(bike_id)
    Bike.exists?(bike_id)
  end

  def real_trip_id?(trip_id)
    Trip.exists?(trip_id)
  end

end
