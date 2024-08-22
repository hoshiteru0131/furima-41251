# Rails.application.routes.draw do
#   get 'items/index'
#   devise_for :users
#   resources :users, only: [:show]
#   resources :items do
#     resources :orders, only: [:index, :create]
#   end

#   root to: 'items#index'
#   resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
#   resources :items do
#     resources :orders, only: [:index, :create]
#   end
 

# end
Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :items do
    resources :orders, only: [:index, :create]
  end

  root to: 'items#index'
  
end