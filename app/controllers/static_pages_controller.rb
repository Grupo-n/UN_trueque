class StaticPagesController < ApplicationController

  def principal
    @products = Product.all
    #@products = Product.where(:condicion_ejemplo => 1).order("created_at DESC").paginate(:page => params[:page]), :per_page => 10)
    @products = Product.paginate(:page => params[:page], :per_page => 9)
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

end
