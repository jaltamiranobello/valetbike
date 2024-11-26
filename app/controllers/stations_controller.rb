class StationsController < ApplicationController

  def index
    @stations = Station.all.order(identifier: :asc)
  end

  #gets the current_bike id and then displays that bike on the view template
  def show
    @current_station = Station.find_by(identifier: params[:identifier])
    @bikes = Bike.where(current_station_id: @current_station.identifier)
  end

end
