# == Schema Information
#
# Table name: trip_activities
#
#  id          :integer          not null, primary key
#  trip_id     :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TripActivity < ActiveRecord::Base
  belongs_to :trip
  belongs_to :activity
end
