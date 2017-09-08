class UserMailer < ApplicationMailer
  default from: 'robinleoknauth@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://venom10-leoxugu.c9users.io/about'
    mail(to: @user.email, subject: 'Welcome to Venom10')
  end
end
