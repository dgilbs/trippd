class TripDestinationsController < ApplicationController 

  def create
    @trip = Trip.find(current_user.current_trip_id)
    @destination = Destination.find(params[:id])
    @trip.destinations << @destination if !(@trip.destinations.include?(@destination))
    @trip.save

    render json: @destination
  end

  def destroy
    # binding.pry
    @destination = Destination.find(params[:destination_id])
    @trip = Trip.find(current_user.current_trip_id)
    @trip.destinations.delete(@destination)
    @trip.delete_dependent_activities(@destination)
    @trip.save

    render json: @destination
  end

end
