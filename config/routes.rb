Rails.application.routes.draw do
  # adds routes for payments
  resources :payments
  post 'payments/create'
  get 'payments/success'
  get 'payments/cancel'
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
  
  root to: "home#main"
end

