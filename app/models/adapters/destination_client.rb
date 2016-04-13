module Adapters
 class DestinationClient

  def self.find_restaurant_by_location(destination)
    response = Yelp.client.search(destination, { term: 'food', sort: 2 })
    binding.pry
    arr = []
    response.businesses.each do |business|
      name = business.name
      link = business.url
      activity = Activity.find_or_create_by(name: name, link: link)
      activity.categories.push(Category.find_by(name: "Restaurants"))
      activity.save
      arr << activity
    end
    arr
  end

 end

end