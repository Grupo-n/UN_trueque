Rails.application.routes.draw do

  resources :barters
  resources :products
  resources :services
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "welcome#new"
  
  get 'my_products/index'
  get 'my_products/myobjects'
  get 'my_products/myservices'
  
  get 'products/:id/offer' => "products#offer", as: 'offer'
  
  get 'welcome/index'
  get 'static_pages/principal' , :as => :user_home
  get 'my_products/myobjects' , :as => :myObjects
  get 'my_products/index' , :as => :myObjectsProducts

  get 'user/view-profile', :to =>'static_pages#profileInformation', :as => :user_information

  as :user do
    get 'user/edit-profile', :to => 'devise/registrations#edit', :as => :user_edit
  end

  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  
end
