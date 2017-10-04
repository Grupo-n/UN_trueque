class StaticPagesController < ApplicationController
  
  def principal
    @all = Product.select('id')
  end
  
  
  
end
