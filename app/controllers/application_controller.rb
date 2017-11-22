class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :contact, :new, :create]
  before_action :set_search

  #def after_sign_in_path_for(resource)
  #  '/static_pages/principal'
  #aend

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @categories = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :avatar_cache, :score])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :score])
  end

  def set_search
    @search = Product.descendent.search(params[:q])
    if params[:search]
      search_params = CGI::escapeHTML(params[:search])
      redirect_to ("/static_pages/principal?utf8=%E2%9C%93&search=#{search_params}")
    end
  end

end
