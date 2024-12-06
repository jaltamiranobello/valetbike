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

  def edit 
    @stations = Station.all.order(identifier: :asc)
    if Trip.find_by_id(params[:id]).present?
      @trip = Trip.find_by(id: current_user.id)
      @bike = Bike.find_by(identifier: @trip.bike_used); 
    end

  end

  def update
    @trip = Trip.where(user_id: current_user.id).order(created_at: :desc).first
  
    if @trip.nil?
      flash[:alert] = "Trip not found"
      redirect_to trips_index_path and return
    end

    station = Station.find_by(identifier: params[:identifier])
    
    if station.nil?
      flash[:alert] = "Station not found"
      redirect_to edit_trips_path(@trip) and return
    end

    bike = Bike.find_by(identifier: @trip.bike_used.identifier)
    
    if bike.nil?
      flash[:alert] = "Bike not found"
      redirect_to trips_edit_path(@trip) and return
    end

    # station = Station.find_by(params[:identifier]) 
    station.docked_bikes << bike
    @trip.update(end_time: Time.now, end_station_id: station.identifier)
    #call the calculate price method and then update the price column with it's return value
    @trip.save
    #user is returned payment page 
    #redirect_to payments new path with the trip object as a param and do the calculations of price
    redirect_to stations_index_path
  end 

  def calculate_price(trip_id)
    trip = Trip.find_by(id: trip_id)
    rideTime = trip.end_time - trip.start_time
    rideTime * 0.25
  end 

end
