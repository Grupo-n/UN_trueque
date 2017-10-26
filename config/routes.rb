Rails.application.routes.draw do

  resources :barters, :products, :services

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #Pagina principal
  root :to => "welcome#new"

  #Productos usuario
  get 'my_products/index'
  get 'my_products/myobjects'
  get 'my_products/myservices'
  get 'my_products/offer'

  get 'products/:id/offer' => "products#offer", as: 'offer'
  get 'statistics/products', :to => "products#statistics", :as => :products_statistics
  get 'my_products/:id/offer' => "my_products#offer", as: 'my_offer'

  #Pagina principal
  get 'welcome/index'
  get 'static_pages/principal' , :as => :user_home
  get 'my_products/myobjects' , :as => :myObjects
  get 'my_products/myservices' , :as => :myServices
  get 'my_products/index' , :as => :myObjectsServices

  #Información de usuario
  get 'user/view-profile', :to =>'static_pages#profileInformation', :as => :user_information

  #Editar informacion de usuario
  as :user do
    get 'user/edit-profile', :to => 'devise/registrations#edit', :as => :user_edit
  end

  #Pagina de contacto
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  end
