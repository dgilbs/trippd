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
#

class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
end
