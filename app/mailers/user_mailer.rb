class UserMailer < ApplicationMailer

  def user_password(user)
    @user = user
    mail(to: @user.email, subject: 'ZPO your password')
  end
end
