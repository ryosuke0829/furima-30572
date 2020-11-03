Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root to: "items#index" 
  resources :users, only: [:edit, :update]

end