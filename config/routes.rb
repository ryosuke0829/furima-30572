Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" 
  get 'items/search'
  resources :items, except: [:index] do
    resources :orders, only: [:index, :create]
  end
end