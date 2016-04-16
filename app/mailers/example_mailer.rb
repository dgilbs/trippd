class ExampleMailer < ApplicationMailer
  default from: "wheecombinator@gmail.com"

  def trip_email(email, trip)
    @trip = trip
    @email = email
    mail to: @email, subject: 'Your upcoming trip' 
  end

end