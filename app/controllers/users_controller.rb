# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string
#  email           :string
#  age             :date
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  first_name      :string
#

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/trips', notice: 'Welcome!'
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :password, :password_confirmation)
  end 

end
