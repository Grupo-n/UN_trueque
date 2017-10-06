class StaticPagesController < ApplicationController

  def principal
    @user = current_user
    @products = Product.all
  end

  def profileInformation
    render '/static_pages/profileInformation'

  end

end
