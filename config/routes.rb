Rails.application.routes.draw do 
  
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
  get 'trip/index'
  get 'trip/book'
  get 'trip/confirm'
  get 'stations_map/index'
 
  root to: "home#main"

end