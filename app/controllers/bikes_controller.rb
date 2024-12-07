class BikesController < ApplicationController
  
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find_by(current_station_id: params[:current_station_id])
  end


  
end