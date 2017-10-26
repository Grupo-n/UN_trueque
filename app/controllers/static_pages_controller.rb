class StaticPagesController < ApplicationController

before_action :search

  def principal
    @search = Product.descendent.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 12)
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

  private
      def search
        if params[:search]
          search_params = CGI::escapeHTML(params[:search])
          redirect_to ("/static_pages/principal?utf8=%E2%9C%93&search=#{search_params}")
        end
      end

  end
