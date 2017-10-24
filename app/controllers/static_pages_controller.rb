class StaticPagesController < ApplicationController

before_action :search

  def principal
    #@products = Product.all
    ##@products = Product.where(:condicion_ejemplo => 1).order("created_at DESC").paginate(:page => params[:page]), :per_page => 10)
    #@products = Product.paginate(:page => params[:page], :per_page => 9)
    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 12)
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
