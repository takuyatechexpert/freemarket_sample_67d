Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  
  resources :items, only: [:new, :create]
  resources :home 
  resources :users
  resources :items, only: :new

  get 'cards' => 'cards#index'
  post 'cards/pay' => 'cards#pay'  
  resources :buyers
end
