Rails.application.routes.draw do
  resources :trips
  #get 'trips/index'
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


  get "stations/show"


  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/edit'
  get 'bikes/delete'
  get 'bikes/new'
  

#developed this new route to use it later in the html page
#so that we could display the bikes and the stations in different view pages



end
