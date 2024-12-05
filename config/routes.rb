Rails.application.routes.draw do
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel'
  get 'trips/create', to: 'trips#create', as:'create_trip'
  get 'trips/update', to: "trips#update", as:'update_trip'
  get 'trips/return_bike'
  resources :payments 
  resources :trips
  get 'trips/index'
  get 'trips/new'


  get 'card/remove_card'
  get 'card/update_payment'
  get 'card/verify_payment'
  get 'card/pay'

  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  # get 'trips/new'

  
  #post 'payments/create'
  # get 'payments/success'
  # get 'payments/cancel'
  # adds devise routes for Users 
  devise_for :users

  get "stations/show"
  get "stations/index"
  get 'bikes/index'
  get 'bikes/show'
  get 'users/show'
  get "stations/show"
  get "stations/index"
  get 'card/remove_card'
  get 'card/update_payment'
  get 'card/verify_payment'
  get 'card/pay'
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  
  get 'users/verify_account'
  get 'users/delete_account'

  root to: "home#main"

end
