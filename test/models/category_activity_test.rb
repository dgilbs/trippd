# == Schema Information
#
# Table name: category_activities
#
#  id          :integer          not null, primary key
#  category_id :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CategoryActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
