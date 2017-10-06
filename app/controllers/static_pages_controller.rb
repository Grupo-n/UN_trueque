class StaticPagesController < ApplicationController

  def principal
  end

  def profileInformation
    render '/static_pages/profileInformation'

  end

end
