Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  resources :users, only: [:show]

  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  
end
