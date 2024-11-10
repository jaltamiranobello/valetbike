Rails.application.routes.draw do
  # Resources for payments and trips
  resources :payments
  resources :trips

  # Card-related routes
  get 'card/remove_card'
  get 'card/update_payment'
  get 'card/verify_payment'
  get 'card/pay'

  # Bike-related routes
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'

  # User-related routes with Devise
  devise_for :users
  get 'users/show'
  get 'users/verify_account'
  get 'users/delete_account'

  # Station and bike routes
  get "stations/show"
  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/edit'
  get 'bikes/delete'
  get 'bikes/new'

  # Root route 
  root to: "home#main"


end
