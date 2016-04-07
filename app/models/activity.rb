# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  destination_id :integer
#  name           :string
#  cost           :integer
#  rigor          :integer
#  min_group_size :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Activity < ActiveRecord::Base
end
