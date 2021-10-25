Rails.application.routes.draw do


   #顧客側　【customer】
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "publics/registrations",
  sessions: 'publics/sessions'
}


 #devise_for :customers, controllers: {
  # sessions:      'publics/sessions',
   #passwords:     'publics/passwords',
   #registrations: 'publics/registrations'
  #}

    #管理者側　【admin】
   devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
     sessions: "admins/sessions"
   }


  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'homes/login', to: 'homes#login', as: 'login'
  get 'homes/search/:id', to: 'homes#search', as: 'search'

  scope module: 'public' do
    resource :customer, only: [:show, :edit, :update] do
      collection do
        get 'quit'
        patch 'withdraw'
        # get 'thanks'
      end
    end
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :show, :create, :update, :destroy] do
      collection do
        delete 'all_destroy'
      end
    end
    resources :orders, only: [:new, :index, :create, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    # root :to => “homes#top”
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  # namespace :customers do
  #   patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
  #   get 'show' => 'customers#show'
  #   get 'customers/edit' => 'customers#edit'
  #   patch 'update' => 'customers#update'
  #   get 'quit' => 'customers#quit'
  # end
end
