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

class DestinationsController < ApplicationController

  def index
   
    if query_params != {}
      query = query_params[:query]
      @search_results = Destination.search(query)
      render json: @search_results
    end
    north_american_cities = Destination.where(continent: "North America").order_by_city
    south_american_cities = Destination.where(continent: "South America").order_by_city
    european_cities = Destination.where(continent: "Europe").order_by_city
    african_cities = Destination.where(continent: "Africa").order_by_city
    asian_cities = Destination.where(continent: "Asia").order_by_city
    australian_cities = Destination.where(continent: "Australia").order_by_city
    @destinations = [north_american_cities, south_american_cities, european_cities, african_cities, asian_cities, australian_cities]

  end

  def show
    @destination = set_destination
    @restaurants = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Restaurants")
    @shopping_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Shopping")
    @cultural_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Cultural")
    @spa_fitness_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Spa/Fitness")
    @music_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Music")
    @active_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Active")
    # Adapters::PhotoClient.find_coordinates_by_name(@destination.city) 
  end


  private

  def set_destination
    Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:city, :state, :country, :continent, activity_ids:[])

  end
  def query_params
     params.permit(:query)
  end
end
