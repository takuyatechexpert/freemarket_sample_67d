Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root 'toppages#index'
  
  resources :items do 
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :categories, only: [:index, :show, :new, :edit, :destroy]
  resources :home 
  resources :users

  resources :buyers do
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

