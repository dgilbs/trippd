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

  def self.most_popular_destination
    mp = self.handles_tie_for_most_popular
    if mp.length == 1
      mp[0]
    else
      array = mp.map { |d| d }
      #returns an array
    end
  end

 def self.handles_tie_for_most_popular
  most_popular = TripDestination.group(:destination_id).count
  final = most_popular.map { |k, v| k if v == most_popular.values.max }
    final.compact.map do |id|
      Destination.find(id).city
    end
  end

  # def self.most_popular_destination
  #   #DOESNT TAKE INTO ACCOUNT TIE
  #   id = TripDestination.maximum("destination_id")
  #   most_popular_destination = Destination.find(id).city
  # end
  
 



end
