Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  
  # resources :items, only: :new
end
