class TripsController < ApplicationController
  # shows a list of trips
  def index 
    # select only the trips that you made with ID
    # @current_user = User.find_by(id: params[:id])
    @trips = Trip.where(user_id: current_user.id)
  end

  # shows a single trip
  def show
    @trip = Trip.find_by(identifier: params[:identifier])
  end

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
        # bike = Bike.find_by(identifier: params[:identifier])
        # bike.current_station.docked_bikes.delete(Bike.find_by(identifier: bike.identifier))
        render 'show'
      else
        render plain: "FAILED: #{@trip.errors.full_messages.join(', ')}"
      end
    else
      flash[:alert] = "Bike not found"
      redirect_to trips_path
    end
  end

  def edit 
    @stations = Station.all.order(identifier: :asc)
    if Trip.find_by_id(params[:id]).present?
      @trip = Trip.find_by_id(params[:id])
      @bike = Bike.find_by(identifier: @trip.bike_used); 
    end

  end

  def update
    station = Station.find_by(params[:identifier]) 
    station.docked_bikes << Bike.find_by(identifier: Trip.find_by_id(params[:id]).bike_used)
    Trip.find_by_id(params[:id]).update(end_time: Time.now, end_station_id: station.identifier)
    Trip.find_by_id(params[:id]).save
    #user is returned payment page 
    redirect_to new_payment_path
  end 

  def calculate_price(trip_id)
    trip = Trip.find_by(id: trip_id)
    rideTime = trip.end_time - trip.start_time
    rideTime * 0.25
  end 

end
