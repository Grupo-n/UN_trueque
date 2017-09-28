class ContactusController < ApplicationController
  def index
    @contact = Contactus.new(params[:contactus])
  end

  def create
    @contact = Contactus.new(params[:contactus])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Contactus object for cleared form
        @contact = Contactus.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end