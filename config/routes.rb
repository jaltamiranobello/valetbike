Rails.application.routes.draw do
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel'
  resources :payments
  # get 'payments/new'
  # post 'payments/new', to: 'payments#create'
  # get 'payments/edit'
  # get 'payments/update'
  # adds routes for payments
  # adds devise routes for Users 
  devise_for :users

  get 'users/show'

  get 'stations/show'
  get 'stations/index'

  get 'bikes/index'
  

  
  get 'card/remove_card'
  get 'card/update_payment'
  get 'card/verify_payment'
  get 'card/pay'

  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'

  
  root to: "home#main"
end

