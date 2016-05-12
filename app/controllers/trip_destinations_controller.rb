class TripDestinationsController < ApplicationController 

  def create
    @trip = Trip.find(current_user.current_trip_id)
    @destination = Destination.find(params[:id])
    @trip.destinations << @destination if !(@trip.destinations.include?(@destination))
    @trip.save

    render json: @destination
  end

end
