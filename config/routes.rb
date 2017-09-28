Rails.application.routes.draw do

<<<<<<< HEAD
  resources :transactions
  resources :money
  resources :products
  resources :services
  resources :items
  resources :people
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
=======

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

>>>>>>> github/miguelC-Spring2
  root :to => "welcome#new"
  get 'welcome/index'
  get 'static_pages/principal'
  get '/contact' => 'welcome#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
