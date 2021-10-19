Rails.application.routes.draw do

  root to: 'homes#home'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'homes/login', to: 'homes#login', as: 'login'
  
  resources :items, only: [:show]
  resource :cart_item
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
