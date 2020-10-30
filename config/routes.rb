Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "items#index" 
  resources :users, only: [:edit, :update]

end