class TripsController < ApplicationController
  # shows a list of trips
  def index 
    # select only the trips that you made with ID
    @trips = Trip.find_by(user_id: current_user.id).order(identifier: :asc)
  end

  # shows a single trip
  # def show
  #   @current_station = Station.find_by(identifier: params[:identifier])
  #   @bikes = Bike.where(current_station_id: @current_station.identifier)
  # end

  def new
    @bike = Bike.find_by(identifier: params[:identifier])
    if @bike
      @trip = Trip.new(
        bike_used_id: @bike.identifier,
        start_station_id: @bike.current_station.identifier,
        user_id: current_user.id,
        start_time: Time.current
      )
    else
      flash[:alert] = "Bike not found"
      redirect_to trips_path
    end
  end

  def create
    @bike = Bike.find_by(identifier: params[:identifier])
    if @bike
      @trip = Trip.new(
        bike_used_id: @bike.identifier,
        start_station_id: @bike.current_station.identifier,
        user_id: current_user.id,
        start_time: Time.current
      )
      
      if @trip.save
        # Update the bike's status or location if necessary
        bike = Bike.find_by(identifier: params[:identifier])
        bike.current_station.docked_bikes.delete(Bike.find_by(identifier: bike.identifier))
        render 'show'
      else
        render plain: "FAILED: #{@trip.errors.full_messages.join(', ')}"
      end
    else
      flash[:alert] = "Bike not found"
      redirect_to trips_path
    end
  end

  def update
    # get station from identifier
    # set the end station
    # set the end time
    # set the end price
    # send in the trip id with path
    redirect_to new_payment_path
  end 

  # shows a list of stations in order to choose a station to end at
  def return_bike
    @stations = Station.all.order(identifier: :asc)
  end

  def calculate_price(trip_id)
    trip = Trip.find_by(id: trip_id)
    rideTime = trip.end_time - trip.start_time
    trip.price = rideTime * 0.25
  end 
  
end
