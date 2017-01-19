class UserMailer < ApplicationMailer
  default from: 'everyone@appacademy.io'

  def welcome_email(user)
    @user = user
    mail(to: @user.username, subject: 'Welcome to 99 Cats, my cat-loving friend!')
  end

end
