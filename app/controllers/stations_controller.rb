class StationsController < ApplicationController
  
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  #gets the current_bike id and then displays that bike on the view template
  def show
    station_id = params[:station_id].to_i
    @current_station = Station.find(station_id)
  end
  
  # adds the current bike to the current station the user is at
  def return_bike
    
    if hasbike
      puts "error"
 
    else
      @customer_station.docked_bikes<< @current_bike
    end

  end
  
  # checks if the customer station has this specific bike  
  def hasbike
    station_params
    return @current_bike.current_station == @customer_station
  end
    
  # removes the customer's bike from the current station they are at
  def checkout_bike
    unless hasbike
      puts "error"
    else
      @customer_station.docked_bikes.delete(@current_bike)

    end
  end

 

  # gets the current_station_id and bike_id from the parameters and stores those two values in two instance variables
  def station_params
      # params.require(:bike_id)
      # params.require(:station_id)
      station_id = params[:station_id].to_i
      bike_id = params[:bike_id].to_i
      @customer_station = Station.find(station_id)
      @current_bike = Bike.find(bike_id)
  end

end
