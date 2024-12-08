class MapTestController < ApplicationController
    def index
      if params[:location].present?
        # Geocode the user's input address
        user_location = Geocoder.search(params[:location]).first&.coordinates
  
        if user_location
          # Find the nearest stations 
          @stations = Station.near(user_location, 10).limit(3)
        else
          @stations = []
        end
      else
        @stations = Station.all
      end
    end

    def map_test
        if params[:location].present?
          user_location = Geocoder.search(params[:location]).first&.coordinates
          @stations = user_location ? Station.near(user_location, 10).limit(3) : []
        else
          @stations = [] # Ensure it's empty initially
        end
      end
      
      
  end
  
  

  
  