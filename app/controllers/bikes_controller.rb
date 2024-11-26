class BikesController < ApplicationController
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
