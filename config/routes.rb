Rails.application.routes.draw do
  devise_for :users

  get 'users/show'
  
  root to: "home#main"
end
