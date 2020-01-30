Rails.application.routes.draw do
  devise_for :users
  resources :toppages, only: :index
    
end
