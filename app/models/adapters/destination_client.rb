module Adapters
 class DestinationClient

  def self.find_activity_by_location(destination, activity)
    obj = {"Restaurants": "food", "Music": "Music Venues",  "Spa/Fitness": "spa", "Active": "active", "Cultural": "museums", "Shopping": "shopping"}
    response = Yelp.client.search(destination, { term: obj[activity.to_sym], sort: 2 })
    arr = []
    response.businesses.each do |business|
      name = business.name
      link = business.url
      current_activity = Activity.find_or_create_by(name: name, link: link, destination_id: Destination.find_by(city: destination).id)
      current_activity.categories.push(Category.find_by(name: activity))
      current_activity.save
      arr << current_activity
    end
    arr
  end

  def self.find_destination(destination)
    response = Yelp.client.search(destination)
    city = response.businesses.first.location.city
    state = response.businesses.first.location.state_code
    destination = Destination.find_or_create_by(city: city, state: state)
  end


 end

end