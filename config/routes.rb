Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  resources :home 
  resources :items, only: :new
  resources :buyers
end
