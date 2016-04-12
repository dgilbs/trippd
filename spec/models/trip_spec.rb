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
#  range        :string
#

require 'rails_helper'

describe 'Trip' do

  it 'belongs to a user' do 
    user = User.create(first_name: "Michelle", email: "michelle@email.com", password_digest: "ab124")
    trip = user.trips.create
    expect(trip.user).to eq(user)
  end

  it 'belongs to a user through the user id' do 
    user = User.create(first_name: "David", email: "david@email.com", password_digest: "doughnut21398", id: 1)
    trip = Trip.create(user_id: 1)
    expect(trip.user).to eq(user)
  end

describe "#cost_per_person" do 
  trip = Trip.create(budget: 1200, total_guests: 3)
  context 'calculates avg cost per guest' do 
    it 'shows the trip cost per guest' do
      expect(trip.cost_per_person).to eq(400)
    end
  end 
end

describe "#duration" do 
  trip = Trip.create(start_date: "2016-01-12", end_date: "2016-01-17")
  context 'calculates duration of trip' do 
    it 'shows length of trip in days' do
      expect(trip.duration).to eq(5)
    end
  end 
end

describe "#budget_to_range" do 
  trip = Trip.create(start_date: "2016-01-12", end_date: "2016-01-17", budget: 100)
  context 'calculates budget per day of trip' do 
    it 'shows $ range of daily budget' do
      trip.budget_to_range
      expect(trip.range).to eq("$")
    end
  end 
end

end
