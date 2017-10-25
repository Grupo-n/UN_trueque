class UserMailer < ApplicationMailer
  default from: "un.truequeapp@gmail.com"
  default to: "un.truequeapp@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://untrueque.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenido a UNTrueque')
  end

  def new_message(message)
    @message = message
    mail subject: "Message contact from #{message.name}"
  end

  def new_barter(barter, product, user, userbarters)
    @barter = barter
    @product = product
    @user = user
    @userbarters = userbarters
    @url = 'http://untrueque.herokuapp.com'
    mail(to: @user.email, subject: 'Recibiste una nueva oferta')
  end

end
