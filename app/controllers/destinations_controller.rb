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
    @destinations = Destination.order_by_city
    # @destinations_by_search = Destination.search(@query)
  end

  def show
    @destination = set_destination
    @restaurants = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Restaurants")
    @shopping_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Shopping")
    @cultural_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Cultural")

    @spa_fitness_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Spa/Fitness")
    @music_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Music")
    @active_activities = Adapters::DestinationClient.find_activity_by_location(@destination.city, "Active")
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
