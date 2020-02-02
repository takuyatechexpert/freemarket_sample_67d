Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  
  resources :items, only: [:new, :create]
  resources :home 
  resources :items, only: :new
  resources :buyers
end
