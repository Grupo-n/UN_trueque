Rails.application.routes.draw do

  #Pagina principal
  root :to => "welcome#new"

  #Devise
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope(path_names: { new: 'nueva', show: 'ver' }) do
    resources :barters, path: 'barters', only: [:show, :new, :edit, :create, :update, :destroy] do
      member do
        get :change_ubication
        get :score
      end
    end
  end

  scope(path_names: { new: 'nuevo', show: 'ver', edit: 'editar' }) do
    resources :products, path: 'products', only: [:new, :show, :edit, :create, :update, :set_product, :destroy] do
      collection do
        match 'search' => 'application#search', via: [:get, :post], as: :search
      end
      member do
        get :offer
      end
    end
  end

  scope(path_names: { index: 'myproducts'}) do
    resources :my_products, path: 'my_products', only: [:index] do
      member do
        get :offer
        get :accept
        get :succesfull_transaction
      end

      collection do
        get :myobjects
        get :myservices
        get :offer
        get :mytransactions
        get :offers_made
        get :offers_received
      end
    end
  end

  scope(path_names: {index: 'comments'}) do
    resources :comments, only: [:create, :new, :set_comment]
  end

  #Información de usuario
  #get 'user/view-profile', :to =>'static_pages#profileInformation', :as => :user_information

  get 'user/view-profile', :to =>'my_products#profile_information', :as => :user_information

  #Editar informacion de usuario
  as :user do
    get 'user/edit-profile', :to => 'devise/registrations#edit', :as => :user_edit
  end

  #Pagina de contacto
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  #Pagina principal
  get 'welcome/index'
  get 'static_pages/principal' => 'static_pages#principal', :as => :user_home
  #Estadisticas
  get 'statistics/products', :to => "products#statistics", :as => :products_statistics


  #Generar factura transaccion completa
  get 'my_products/:id/succesfull_transaction/:hash' => "my_products#generate_barter_pdf", as: 'generate_facture'
  end
