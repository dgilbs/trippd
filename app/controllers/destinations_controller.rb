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
  end

  def show
    businesses = Yelp.client.search("New York", { term: 'food', sort: 2 })
    binding.pry
    x = []
    businesses.each do |business|
      name = business.name
      link = business.url
      activity = Activity.new(name: name, link: link)
      activity.category = Category.find(name: "Restaurant")
      activity.save
      x << activity
    end
    binding.pry
    @destination = set_destination
    @restaurants = @destination.activities_restaurants
    @shopping_activities = @destination.activities_shopping
    @spa_fitness_activities = @destination.activities_spa_fitness
    @music_activities = @destination.activities_music
    @active_activities = @destination.activities_active
  end


  private

  def set_destination
    Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:city, :state, :country, :continent, activity_ids:[])
  end
end
