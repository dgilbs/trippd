# == Schema Information
#
# Table name: packing_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PackingList < ActiveRecord::Base
end
