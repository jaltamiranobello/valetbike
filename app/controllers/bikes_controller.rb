class BikesController < ApplicationController
  def get_bike_id
    self.bike_id
  end

  def get_station_id
    self.station_id
  end

  def get_station_name
    self.station
  end
  
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find_by(current_station_id: params[:current_station_id])
  end

  
  def edit
    @bike = Bike.find(params[:id])
  end

  

  
end
