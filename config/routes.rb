Rails.application.routes.draw do
  devise_for :users

  get 'users/shows'
  
  root to: "home#main"
end
