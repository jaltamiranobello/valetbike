Rails.application.routes.draw do
  get 'trips/create', to: 'trips#create', as:'create_trip'
  resources :payments 
  resources :trips
  get 'trips/index'
  get 'trips/new'
  # get 'trips/create'

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

  get 'users/show'
  
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
