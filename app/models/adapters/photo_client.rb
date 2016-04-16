module Adapters
  class PhotoClient

    def self.connection
      @connection ||= Adapters::FlickrConnection.new()
    end

    def self.find_coordinates_by_name(location)

      information = connection.query({query: location})
      latitude = information.first[1].first[1]["place"].first["latitude"]
      longitude = info.first[1].first[1]["place"].first["longitude"]
  
    end

    

  end 
end