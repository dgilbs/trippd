# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  last_name       :string
#  email           :string
#  date_of_birth   :date
#  password_digest :string
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string
#

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email

  has_many :trips
  has_many :packing_lists
  validates :first_name, presence: true
  has_many :items, through: :packing_lists


  def age
    age = Date.today.year - self.date_of_birth.year
    age = age - 1 if (
         self.date_of_birth.month >  Date.today.month or 
        (self.date_of_birth.month >= Date.today.month and self.date_of_birth.day > Date.today.day)
    )
    age
  end

  def upcoming_trips
    self.planned_trips.select do |trip|
      trip.start_date > Date.today
    end
  end

  def past_trips
    trips = self.planned_trips.select do |trip|
      trip.start_date < Date.today
    end
  end

  def planned_trips
    if !self.trips.nil?
      self.trips.select {|trip| trip.start_date != nil}
    end
  end

  def next_trip
    arr = self.upcoming_trips.sort_by{|trip| trip.start_date}
    arr.first
  end

  def last_trip
    arr = self.past_trips.sort_by{|trip| trip.start_date}
    arr.last 
  end

  def destinations_visited
   if !self.past_trips.nil? 
     arr = self.past_trips.map do |trip|
      trip.destinations if !trip.destinations.nil?
      end
     arr[0]
   end
  end

  def cities_visited
    if !self.destinations_visited.nil?
      self.destinations_visited.map do |dest|
        dest.city 
      end.compact.uniq
    end
  end

  def countries_visited
    if !self.destinations_visited.nil?
      self.destinations_visited.map do |dest|
        dest.country
      end.compact.uniq
    end
  end  

  def cities_by_popularity
    if !self.cities_visited.nil?
      grouped_destinations = self.destinations_visited.group_by {|destination| destination.city}
      grouped_destinations.sort_by{|destination, visits| visits.length}
    end
  end

  def countries_by_popularity
    if !self.countries_visited.nil?
      grouped_destinations = self.destinations_visited.group_by {|destination| destination.country}
      grouped_destinations.sort_by{|destination, visits| visits.length}
    end
  end  

  def find_favorite_city
    array = self.cities_by_popularity.map do |cities|
      cities[0]
    end
    array.last
  end

  def find_favorite_country
    array = self.countries_by_popularity.map do |countries|
      countries[0]
    end
    array.last
  end

  def favorite_city
    if !self.cities_by_popularity.nil?
      self.find_favorite_city
    end
  end


  def favorite_country
    if !self.countries_visited.nil?
      self.find_favorite_country
    end
  end

  def items_by_popularity
    grouped_items=self.items.group_by {|item| item.name}
    grouped_items.sort_by {|item, times_packed| times_packed.length}
  end

  def most_common_packed_items
    array=self.items_by_popularity.map do |items|
      items[0]
    end
    array.last(3)
  end

end
