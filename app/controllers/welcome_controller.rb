class WelcomeController < ApplicationController
  
  def index
  end

  def new
    if current_user
      redirect_to user_home_path
    else
      redirect_to welcome_index_path
    end
  end
  
  

end
