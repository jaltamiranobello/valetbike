Rails.application.routes.draw do
  # Resourceful routes
  resources :payments
  resources :trips, except: [:create] # Explicitly exclude :create since we define it manually

  # Custom trip routes
  get 'trips/create', to: 'trips#create', as: 'create_trip'
  get 'trips/index'
  get 'trips/new'

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

  # Devise routes for users
  devise_for :users
  get 'users/show'
  get 'users/verify_account'
  get 'users/delete_account'

  # Station routes
  get 'stations/show'
  get 'stations/index'

  # Bike routes
  get 'bikes/index'
  get 'bikes/show'

  # Root route
  root to: 'home#main'
  get 'team', to: 'team#index'

end

