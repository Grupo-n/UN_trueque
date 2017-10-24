class StaticPagesController < ApplicationController

before_action :search

  def principal
    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 9)
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

  private
      def search
        if params[:search]
          search_params = CGI::escapeHTML(params[:seach])
          redirect_to ("/static_pages/principal?utf8=%E2%9C%93&search=#{search_params}")
        end
      end

  end
