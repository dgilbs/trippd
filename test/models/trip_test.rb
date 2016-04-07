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

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
