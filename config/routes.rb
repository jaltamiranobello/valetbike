Rails.application.routes.draw do
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
<<<<<<< HEAD
  
  root to: "home#main"
end
=======
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "stations#index"
end
>>>>>>> 79cb473 (Created Bike class and getters)
