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
#  link           :string
#

class Activity < ActiveRecord::Base
  belongs_to :destination 
  has_many :category_activities
  has_many :categories, through: :category_activities

  def restaurants
  end

  def cultural
  end

  def music
  end

  def spa_fitness
  end

  def shopping
  end

  def active
  end

  

end
