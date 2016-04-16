class ExampleMailer < ApplicationMailer
  default from: "wheecombinator@gmail.com"

  def trip_email(user, trip)
    @trip = trip
    @user = user
    mail to: user.email, subject: 'Your upcoming trip' 
  end

end