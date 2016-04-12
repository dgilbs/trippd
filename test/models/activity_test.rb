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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
