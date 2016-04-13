module Adapters
 class DestinationClient

  def self.find_restaurant_by_location
   x = Yelp.client.search("New York", { term: 'food', sort: 2 })
   binding.pry
  end

 end

end