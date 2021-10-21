Rails.application.routes.draw do
 
  
 # 顧客側　【public】
 devise_for :publics,skip: [:passwords,], controllers: {
   sessions:      'public/sessions',
   registrations: 'public/registrations'
  }
  
  
  
  
 # 管理者側　【admin】
 
   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
   }
  
  #奇跡
  
  
   scope module: :public do
   
   
   resource :customers, only:[:show ,:edit,:update] do
   collection do
   get 'quit'
   patch 'out'
  
 end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
