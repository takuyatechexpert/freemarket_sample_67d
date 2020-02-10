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

  resources :card do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end

