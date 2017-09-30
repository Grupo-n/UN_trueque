class MessagesController < ApplicationController
  def new
   @message = Message.new
  end

  def create
   @message = Message.new(message_params)

   if @message.valid?
     UserMailer.new_message(@message).deliver
     redirect_to root_path, notice: "Tu mensaje de contacto ha sido enviado"
   else
     flash[:alert] = "An error occurred while delivering this message."
     render :new
   end
  end

  private

  def message_params
   params.require(:message).permit(:name, :email, :content)
  end
end
