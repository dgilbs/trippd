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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
