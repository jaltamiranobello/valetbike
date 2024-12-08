Rails.application.routes.draw do
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel'
  get 'trips/create', to: 'trips#create', as:'create_trip'
  get 'trips/update', to: "trips#update", as:'update_trip'
  
  resources :payments 
  
  get 'trips/index'
  get 'trips/new'
  get 'trips/show'
  get 'trips/edit'


  
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
  
  
  get 'users/verify_account'
  get 'users/delete_account'

  root to: "home#main"

end

