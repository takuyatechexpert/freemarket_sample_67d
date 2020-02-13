Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root 'toppages#index'
  
  resources :items do 
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
  end
  
  resources :categories, only: [:index, :show, :new, :edit, :destroy]
  
  resources :home 
  resources :users

  resources :buyers, only: :show do
    member do
      post 'pay', to: 'buyers#pay'
      get 'done', to: 'buyers#done'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


end

