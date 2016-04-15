# module Adapters
#   class PhotoClient

#     def self.connection
#       @connection ||= Adapters::FlickrConnection.new()
#     end

#     def self.find_destination_by_name(location)
#       # 1. Has to hit my api
#     information = connection.query({query: location})
    
#       Artist.create(name: artist_hash["name"], url: artist_hash["images"].first["url"])
#     end

#   end 
# end