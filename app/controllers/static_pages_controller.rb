class StaticPagesController < ApplicationController
  
  def principal
    @user = current_user
    @products = Product.all
  end
  
end
