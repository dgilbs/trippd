# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  destination_id :integer
#  name           :string
#  cost           :string
#  rigor          :integer
#  min_group_size :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  link           :string
#

class Activity < ActiveRecord::Base
  belongs_to :destination 
  has_many :category_activities
  has_many :categories, through: :category_activities
  has_many :trip_activities
  has_many :trips, through: :trip_activities

  def self.restaurants
    joins(:categories).where(:categories =>{name: "Restaurants"})
  end

  def self.cultural
    joins(:categories).where(:categories =>{name: "Cultural"})
  end

  def self.music
    joins(:categories).where(:categories =>{name: "Music"})
  end

  def self.spa_fitness
    joins(:categories).where(:categories =>{name: "Spa/Fitness"})
  end

  def self.shopping
    joins(:categories).where(:categories =>{name: "Shopping"})

  end

  def self.active
    joins(:categories).where(:categories =>{name: "Active"})
  end

  

end
