class StaticPagesController < ApplicationController
  
  def principal
    @user = current_user
  end
  
end
