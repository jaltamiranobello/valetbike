class TripsController < ApplicationController
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  #gets the current_bike id and then displays that bike on the view template
  def show
    @current_station = Station.find_by(identifier: params[:identifier])
    @bikes = Bike.where(current_station_id: @current_station.identifier)
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
  end

  def update
  end

end
