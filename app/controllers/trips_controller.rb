class TripsController < ApplicationController


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
      redirect_to stations_index_path
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
        render 'confirmation'
      else
        render plain: "FAILED: #{@trip.errors.full_messages.join(', ')}"
      end
    else
      flash[:alert] = "Bike not found"
      redirect_to stations_index_path
    end
  end

  def calculate_price
    #Access the start time hours
    #Access the start time minutes

    #Access the end time hours
    #Acces the end time minutes

    #total_time =
  end

end
