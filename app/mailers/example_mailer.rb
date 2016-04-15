class ExampleMailer < ApplicationMailer
  default from: "wheecombinator@gmail.com"

  def trip_email(user)
    @user = user
    mail to: user.email, subject: 'Your upcoming trip' 
  end

end