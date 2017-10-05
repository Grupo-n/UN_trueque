class StaticPagesController < ApplicationController

  def principal
    @all = Product.select('id')
  end

  def profileInformation
    render '/static_pages/profileInformation'
  end

end
