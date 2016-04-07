require 'rails_helper'

describe 'Trip' do

  it 'belongs to a user' do 
    user = User.create(name: "Michelle")
    trip = user.trips.create
    expect(trip.user).to eq(user)

  end

  it 'belongs to a user through the user id' do 
    user = User.create(name: "David")
    trip = Trip.create(user_id: 1)
    expect(trip.user).to eq(user)
  end

 


end