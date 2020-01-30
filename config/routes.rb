Rails.application.routes.draw do
  get 'toppages/index'
  devise_for :users
    resources :top_pages, only: :index
    
end
