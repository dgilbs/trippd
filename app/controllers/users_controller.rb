# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  age             :date
#  password_digest :string
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UsersController < ApplicationController

  def show
  end
end
