Rails.application.routes.draw do
  get 'users/verify_account'
  get 'users/delete_account'
  root to: "home#index"
end
