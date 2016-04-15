module Adapters
  class FlickrConnection
    include HTTParty
    API_KEY = "a4927460c9883beabef1eb979c2229b8"
    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def query(query)
      self.class.get("https://api.flickr.com/services/rest/?method=flickr.places.find&api_key=#{API_KEY}&query=", {query: query})
    end


  end
end
