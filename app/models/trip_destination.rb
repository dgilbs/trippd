# == Schema Information
#
# Table name: trip_destinations
#
#  id             :integer          not null, primary key
#  trip_id        :integer
#  destination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TripDestination < ActiveRecord::Base
  belongs_to :trip 
  belongs_to :destination
end
