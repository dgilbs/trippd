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

class Destination < ActiveRecord::Base
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations
  has_many :activities

  def self.order_by_city
    Destination.order(:city)
  end  

  def activities_restaurants
    Activity.joins(:categories).where(:categories =>{name: "Restaurants"}).where(:activities => {destination_id: self.id})
  end

  def activities_shopping
    Activity.joins(:categories).where(:categories =>{name: "Shopping"}).where(:activities => {destination_id: self.id})
  end

  def activities_spa_fitness
    Activity.joins(:categories).where(:categories =>{name: "Spa/Fitness"}).where(:activities => {destination_id: self.id})
  end

  def activities_music
    Activity.joins(:categories).where(:categories =>{name: "Music"}).where(:activities => {destination_id: self.id})
  end

  def activities_active
    Activity.joins(:categories).where(:categories =>{name: "Active"}).where(:activities => {destination_id: self.id})
  end

end
