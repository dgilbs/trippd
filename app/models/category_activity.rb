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

class CategoryActivity < ActiveRecord::Base
end
