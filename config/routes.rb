Rails.application.routes.draw do
  devise_for :users
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "home#index"
end
