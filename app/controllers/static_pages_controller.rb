class StaticPagesController < ApplicationController

  def principal
    @products = Product.all
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

end
