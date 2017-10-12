class UserMailer < ApplicationMailer
  default from: "un.truequeapp@gmail.com"
  default to: "un.truequeapp@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://untrueque.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenido a UNTrueque')
  end
  
  def product_accepted(user)
    @user = user
    mail(to: @user.email, subject: 'Tu oferta ha sido aceptada')
  end

  def new_message(message)
    @message = message
    mail subject: "Message contact from #{message.name}"
  end

end
