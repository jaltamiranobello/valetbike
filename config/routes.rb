Rails.application.routes.draw do
  get 'directors/login'
  get 'directors/register'
  get 'directors/verify_email'
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "stations#index"
end