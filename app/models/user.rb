# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  age             :date
#  password_digest :string
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :trips
  has_many :packing_lists
  validates :name, presence: true

  def age
  end

  def upcoming_trips
  end

  def past_trips
  end

end
