Rails.application.routes.draw do
  get 'customers/new'
  post 'customers/create'
  get 'customers/start_trip'
  get 'customers/end_trip'
  get 'customers/past_trip_calculations'

  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  get 'users/verify_account'
  get 'users/delete_account'

  get 'directors/new'
  post 'directors/create'

  get 'customers/create'

  #root to: "stations#index"
  root to: "directors#main"
end