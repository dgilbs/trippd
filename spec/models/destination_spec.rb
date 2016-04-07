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