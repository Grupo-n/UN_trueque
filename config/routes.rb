Rails.application.routes.draw do


  resources :products
  resources :services

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  root :to => "welcome#new"
  get 'welcome/index'
  get 'static_pages/principal' , :as => :user_home
  as :user do
    get 'users/profile', :to => 'devise/registrations#edit', :as => :user_edit
  end
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
