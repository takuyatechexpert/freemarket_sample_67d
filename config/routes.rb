Rails.application.routes.draw do
  devise_for :users
  resources :top_pages, only: :index
    
end
