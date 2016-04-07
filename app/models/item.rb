# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  packing_list_id :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Item < ActiveRecord::Base
end
