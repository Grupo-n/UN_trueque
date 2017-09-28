class WelcomeController < ApplicationController
  
  def index
  end

  def new
    if current_user
      render '/static_pages/principal'
    else
      render '/welcome/index'
    end
  end
  
  

end
