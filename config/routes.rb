Rails.application.routes.draw do
  get 'customers/update_profile'
  get 'customers/start_trip'
  get 'customers/end_trip'
  get 'customers/past_trip_calculations'
  get 'directors/login'
  get 'directors/register'
  get 'directors/verify_email'
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "stations#index"
end