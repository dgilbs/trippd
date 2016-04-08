# == Schema Information
#
# Table name: trips
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  budget       :integer
#  start_date   :date
#  end_date     :date
#  total_guests :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string
#

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
