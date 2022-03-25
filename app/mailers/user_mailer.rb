# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'admin@musicme.com'
  def welcome_email(user)
    @user = user
    @url = 'http://localhost:1331'
    mail(to: @user.email, subject: 'Welcome To Music Me')
  end

  def activate_account(user)
    @user = user
    @url = "http://localhost:/users/activate?activation_token=#{user.activation_token}"
    mail(to: @user.email, subject: 'Activate Account MusicME')
  end
end
