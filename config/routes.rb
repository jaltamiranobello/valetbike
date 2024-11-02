Rails.application.routes.draw do
  devise_for :users

  get 'users/show'
  
  root to: "home#main"
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  get 'users/verify_account'
  get 'users/delete_account'
end
