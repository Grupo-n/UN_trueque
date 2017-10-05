Rails.application.routes.draw do

  get 'my_products/index'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :products

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "welcome#new"
  get 'welcome/index'
  get 'static_pages/principal' , :as => :user_home

  get 'user/view-profile', :to =>'static_pages#profileInformation', :as => :user_information

  as :user do
    get 'user/edit-profile', :to => 'devise/registrations#edit', :as => :user_edit
  end

  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

end
