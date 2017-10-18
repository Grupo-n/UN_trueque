class StaticPagesController < ApplicationController

  def principal
    @products = Product.all.paginate(:page => params[:page], :per_page => 9)
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

end
