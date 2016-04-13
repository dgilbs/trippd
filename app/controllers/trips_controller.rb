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

class TripsController < ApplicationController
  before_filter :authorize

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save 
      current_user.current_trip_id = @trip.id
      current_user.save
      redirect_to @trip
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @packing_lists = @trip.packing_lists
    @packing_list = @trip.packing_lists.build
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user = User.find(session[:user_id]) 
    @user.current_trip_id = nil if @user.current_trip_id == @trip.id 
    @trip.destroy
    @user.reset_current_trip
    @user.save
    redirect_to trips_path
  end

  def add_destination
    @trip = Trip.find(current_user.current_trip_id)
    @destination = Destination.find(params[:id])
    @trip.destinations << @destination if !(@trip.destinations.include?(@destination))
    @trip.save
    redirect_to destination_path(@destination)
  end

  def add_activity
    @destination = Destination.find(params[:destination_id])
    @trip = Trip.find(current_user.current_trip_id)
    @activity = Activity.find(params[:id])
    @trip.activities << @activity if !(@trip.activities.include?(@activity))
    @trip.save
    redirect_to destination_path(@destination)
  end

  def remove_destination
    @destination = Destination.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @trip.destinations.delete(@destination)
    @trip.delete_dependent_activities(@destination)
    @trip.save
    redirect_to @trip
  end

  def remove_activity
    @activity = Activity.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @trip.activities.delete(@activity)
    @trip.save
    redirect_to @trip
  end

  private

  def trip_params
    params.require(:trip).permit(:budget, :title, :start_date, :end_date, :total_guests, :user_id)
  end


end
