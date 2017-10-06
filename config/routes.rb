Rails.application.routes.draw do

  resources :products
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  
  root :to => "welcome#new"
  
  get 'my_products/index'
  get 'my_products/myobjects'
  get 'my_products/myservices'
  
  get 'welcome/index'
  get 'static_pages/principal' , :as => :user_home
  as :user do
    get 'users/profile', :to => 'devise/registrations#edit', :as => :user_edit
  end
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  
end
