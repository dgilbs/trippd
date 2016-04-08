class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/trips', notice: "Hello"
    else
      flash.now.alert = "You did something wrong"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/trips', notice: "Logged out"
  end

end
