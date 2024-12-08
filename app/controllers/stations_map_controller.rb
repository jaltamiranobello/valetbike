class MapTestController < ApplicationController
  def index
    if params[:location].present?
      # Geocode the user's input address
      user_location = Geocoder.search(params[:location]).first&.coordinates

      if user_location
        # Find the nearest stations within a 10 km radius
        @stations = Station.near(user_location, 10)
      else
        @stations = []
      end
    else
      @stations = Station.all
    end
  end
end