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
  has_many :items
  belongs_to :user
  belong_to :trip
end
