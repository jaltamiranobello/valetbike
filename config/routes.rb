Rails.application.routes.draw do
  #send the login path to get the view of the customer new
  #get '/login', to:'customers#new'

  #instead send the login path to get the view of directors login
  get '/login', to:'directors#login'

  #send the login path to get the customer create method
  #post '/login', to:'customers#create'

  #instead get the login path to get the customer show method
  post '/login', to:'customers#show'

  get 'customers/start_trip'
  get 'customers/end_trip'
  get 'customers/past_trip_calculations'

  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  get 'users/verify_account'
  get 'users/delete_account'

  #send the register path to get the view of customer new
  get '/register', to:'customers#new'
  #send the register path to get the method director create
  #post '/register', to:'directors#create'

  #instead get the register path to get the method customer create
  post '/register', to:'customers#create'

  get 'customers/create'

  #root to: "stations#index"
  root to: "directors#main"
end