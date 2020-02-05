Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  

  resources :items, only: [:index,:new, :create, :show]
  resources :home 
  resources :users
  
  get 'cards' => 'cards#index'
  post 'cards/pay' => 'cards#pay'  
  resources :buyers
end
