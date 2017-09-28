class UserMailer < ApplicationMailer
  default from: "notificaciones@untrueque.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://untrueque.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenido a UNTrueque')
  end

end
