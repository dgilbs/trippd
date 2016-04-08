# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  city       :string
#  state      :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  continent  :string
#

require "rails_helper" 

describe 'Destination' do 

  it 'has many trips' do 
    destination = Destination.create
    trip = Trip.create
    destination.trips.push(trip)
    destination.save
    expect(destination.trips).to include(trip)
  end

end
