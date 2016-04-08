class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    binding.pry
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
  end


end