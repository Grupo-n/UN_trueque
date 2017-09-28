Rails.application.routes.draw do

  get 'contactus/index'

  get '/contact' => 'welcome#contact'


  #resources :contactus, only: [:index, :new, :create]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  
