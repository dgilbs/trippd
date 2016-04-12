class PagesController < ApplicationController

  def home
  end

  def analytics
    set_analytics
    render :analytics
  end


  private 

  def set_analytics
    binding.pry
    @users = User.all
    @destinations = Destination.all 
    @most_popular_destinations = Destination.all.handles_tie_for_most_popular
    @thirties = @users.thirties_avg_budget
    @forties = @users.forties_avg_budget
    @fifties = @users.fifties_avg_budget
    @sixties = @users.sixties_avg_budget
    @seventies = @users.seventies_avg_budget
    @eighties = @users.eighties_avg_budget
    @nineties = @users.nineties_avg_budget
    @two_thousands = @users.two_thousands_avg_budget
  end



end