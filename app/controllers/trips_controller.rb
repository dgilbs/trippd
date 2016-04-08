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

class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save 
      redirect_to @trip
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:budget, :title, :start_date, :end_date, :total_guests)
  end


end
