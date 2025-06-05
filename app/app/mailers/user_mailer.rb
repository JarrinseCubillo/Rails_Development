class UserMailer < ApplicationMailer

  def confirm_account
    @user = params[:user]
    @url = "http://localhost:3000/confirm_email/#{@user.token}"
    mail(to: "javierjjcccastillo93.jjcc@gmail.com", subject: "Welcome to My Omega Blog")
  end
end
