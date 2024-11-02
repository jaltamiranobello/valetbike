Rails.application.routes.draw do
  get 'customers/update_profile'
  get 'customers/start_trip'
  get 'customers/end_trip'
  get 'customers/past_trip_calculations'
  get 'directors/login'
  get 'directors/register'
  get 'directors/verify_email'
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "stations#index"
end