Rails.application.routes.draw do
    


  
root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'homes/login', to: 'homes#login', as: 'login'
  get 'homes/search/:id', to: 'homes#search', as: 'search'

  scope module: 'public' do
    resource :customer, only: [:show, :edit, :update] do
      collection do
        get 'quit'
        patch 'out'
        get 'thanks'
      end
    end
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'all_destroy'
      end
    end
    resources :order, only: [:new, :index, :create, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :address, only: [:index, :create, :edit, :update, :destroy]
  end
  
namespace :admin do
  root :to => "homes#top"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  end
  
end

  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
