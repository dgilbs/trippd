module Adapters
  class FlickrConnection
    include HTTParty
    API_KEY = "a4927460c9883beabef1eb979c2229b8"
    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def query(method, query)
      self.class.get("https://api.flickr.com/services/rest/?method=#{method}&api_key=#{API_KEY}&query=#{query}")
    end

     def photo_query(method, tag, latitude, longitude)
      self.class.get("https://api.flickr.com/services/rest/?method=#{method}&api_key=#{API_KEY}&tag=#{tag}&privacy_filter=1&accuracy=11&content_type=1&has_geo=1&lat=#{latitude}&lon=#{longitude}&limit=1&is_getty=1")
    end


  end
end
