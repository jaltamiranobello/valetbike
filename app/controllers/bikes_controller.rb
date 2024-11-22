class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  
  def edit
    @bike = Bike.find(params[:id])
  end

  

  
end
