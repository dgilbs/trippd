class ExampleMailer < ApplicationMailer
  default from: "wheecombinator@gmail.com"

  def trip_email(email, trip, sender)
    @trip = trip
    @email = email
    @sender = sender
    mail to: @email, subject: 'Your upcoming trip' 
  end

end