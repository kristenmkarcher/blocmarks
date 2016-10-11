class UserMailer < ApplicationMailer
    
  default from: 'notifications@blocmarks.com'
  
  def welcome_email(user)
    @user = user
    @url  = 'https://agile-ridge-99883.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to Blocmarks')
  end
end
