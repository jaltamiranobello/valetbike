class StationsController < ApplicationController
  def main 
  end 
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  def has_bike(bike_id)

  end

  def checkout_bike(bike_id)

  end

  def return_bike(bike_id)

  end

  def get_list_of_bikes(station_id)

  end
end
