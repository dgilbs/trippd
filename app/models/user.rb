# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string
#  email           :string
#  age             :date
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  first_name      :string
#

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email

  has_many :trips
  has_many :packing_lists
  validates :first_name, presence: true

  def age
  end

  def upcoming_trips
  end

  def past_trips
  end

end
