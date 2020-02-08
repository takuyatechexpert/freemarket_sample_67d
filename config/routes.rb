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
  
  get 'cards' => 'cards#index'
  post 'cards/pay' => 'cards#pay'  
  resources :buyers

end

