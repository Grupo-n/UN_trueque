class MyProductsController < ApplicationController
  
  def index
    @products = current_user.products.all
  end
  
  def myobjects
    @products = current_user.products.where("p_type = ?", 1)
  end
  
  def myservices
    @products = current_user.products.where("p_type = ?", 2)
  end
  
end
