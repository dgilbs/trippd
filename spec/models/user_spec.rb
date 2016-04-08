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

require 'rails_helper'

describe 'User' do 

  it "can be created" do 
    @user1 = User.create(name: "Todd")
    expect(@user1.name).to eq("Todd")
  end

  it 'can have many trips' do 
    @user2 = User.create(name: "Joe")
    @trip1 = @user2.trips.create
    @trip2 = @user2.trips.create
    expect(@user2.trips.count).to eq(2)
  end 

  it 'is invalid without a name' do
    @user3 = User.create(email: "joe@gmail.com")
    expect(@user3).to be_invalid
  end 

  it 'is valid with a name' do 
    @user4 = User.create(name: "Bob")
    expect(@user4).to be_valid 
  end
end