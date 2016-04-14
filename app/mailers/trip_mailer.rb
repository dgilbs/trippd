class TripMailer < ApplicationMailer

  def upcoming_trip(user)
    @user = user
    mail(to: @user.email, subject: 'Here is your trip!')
  end 
  
end
