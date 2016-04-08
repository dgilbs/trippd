# == Schema Information
#
# Table name: trips
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  budget       :integer
#  start_date   :date
#  end_date     :date
#  total_guests :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null

class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :trip_tags
  has_many :tags, through: :trip_tags
  has_many :packing_lists
  # validate :checks_doesnt_conflict_with_existing_trips, :checks_start_date_before_end_date

  # def checks_doesnt_conflict_with_existing_trips 
  # end

  # def checks_start_date_before_end_date
  # end

  def duration
  end

  def budget_status
    # calculates sum of activity costs and compares to budget
  end



end
