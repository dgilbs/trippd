# == Schema Information
#
# Table name: trip_tags
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TripTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
