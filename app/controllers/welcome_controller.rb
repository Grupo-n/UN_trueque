class WelcomeController < ApplicationController
  
  def index
  end

  def new
    if current_user
      redirect_to user_home_path
    else
      render '/welcome/index'
    end
  end
  
  

end
