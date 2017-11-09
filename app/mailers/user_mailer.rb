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

  def acceptoffer_email(barter, user_one, user_two)
    @barter = barter
    @user_one = user_one
    @user_two = user_two
    @pone = Product.find(@barter.product_one_id)
    @ptwo = Product.find(@barter.product_two_id)
    @url = 'http://untrueque.herokuapp.com'
    mail(to: [@user_one.email, @user_two.email], subject: 'Se ha realizado un trueque')
    #mail(to: @user_two.email, subject: 'Se ha realizado un trueque')
  end

  def calification_email(barter, user_one, user_two)
    @barter = barter
    @user_one = user_one
    @user_two = user_two
    @pone = Product.find(@barter.product_one_id)
    @ptwo = Product.find(@barter.product_two_id)
    @path = score_barter_url(@barter)
    @url = 'http://untrueque.herokuapp.com'
    mail(to: [@user_one.email, @user_two.email], subject: 'Califica al usuario con el que realizaste una transacción ')
  end

end
