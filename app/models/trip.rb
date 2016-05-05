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
#  title        :string
#  range        :string
#

class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :trip_tags
  has_many :tags, through: :trip_tags
  has_many :packing_lists
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  validate :end_date_is_after_start_date

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
      #jquery alert on form that end date cannot be before start date
     end 
  end

  def duration
    (self.end_date - self.start_date).to_i
    #returns number of days
  end

  def days_til_trip
    @days_til = (self.start_date - DateTime.now.to_date).to_i
  end

  def budget_to_range
    @daily_cost = (self.budget / self.duration)
    # calculate cost per day
    if @daily_cost < 50 
      self.range = "$"
    elsif @daily_cost > 50 && @daily_cost < 100
      self.range = "$$"
    elsif @daily_cost > 100 && @daily_cost < 150
      self.range = "$$$"
    else 
      self.range = "$$$$"
    end
  end

  def cost_per_person
    @cost_per = (self.budget / self.total_guests)
  end

  def most_common_tag
    self.tags.group('tags.name').order('count_id desc').limit(1).count('id')
  end

  def top_three_tags
    self.tags.group('tags.name').order('count_id desc').limit(3).count('id')
  end

  def delete_dependent_activities(dest)
    self.activities.each do |activity|
      self.activities.delete(activity) if activity.destination == dest 
    end
  end

  def self.avg_number_of_guests_per_trip
    guests = []
    self.all.each do |t|
      guests << t.total_guests
    end
    guests.sum / guests.length
  end

  end


