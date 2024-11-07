Rails.application.routes.draw do
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
  devise_for :users
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "home#index"
end
