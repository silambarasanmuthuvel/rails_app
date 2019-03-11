class UserMailer < ApplicationMailer

  def welcome_email(user,topic)
    @user = User.find(user)
    @topic=Topic.find(topic)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end