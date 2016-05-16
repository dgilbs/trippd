class TripActivitiesController < ApplicationController

  def create
    @destination = Destination.find(params[:destination_id])
    @trip = Trip.find(current_user.current_trip_id)
    @activity = Activity.find(params[:activity_id])
    @trip.activities << @activity if !(@trip.activities.include?(@activity))
    @trip.save
    render json: @activity
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @trip = Trip.find(current_user.current_trip_id)
    @trip.activities.delete(@activity)
    @trip.save

    if !params[:trip_id]
      render json: @activity
    else
      redirect_to trip_path(@trip.id)
    end

  end

end
