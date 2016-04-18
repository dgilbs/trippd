module Adapters
  class PhotoClient

    def self.connection
      @connection ||= Adapters::FlickrConnection.new()
    end

    def self.find_coordinates_by_name(location)
      coordinates = []
      information = connection.query("flickr.places.find", location)
      latitude = information.first[1].first[1]["place"].first["latitude"]
      longitude = information.first[1].first[1]["place"].first["longitude"]
      coordinates << latitude
      coordinates << longitude
      coordinates
    end

    def self.find_photo_by_coordinates(coordinates, location)
      latitude = coordinates[0] 
      longitude = coordinates[1]
      information = connection.photo_query("flickr.photos.search", location, latitude, longitude)
      binding.pry
    end

  end 
end