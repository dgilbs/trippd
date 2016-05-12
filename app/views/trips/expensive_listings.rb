require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'

PAGE_URL = "http://streeteasy.com/for-sale/soho/status:open%7Cbeds%3C=1?sort_by=price_desc" 
binding.pry

page = Nokogiri::HTML(open(PAGE_URL))


div = page.css('div#details row')

price = page.css('span#price')

puts "hi"









# [{
#   'listing_class': 'Sale',
#   'address': '13 Crosby Street',
#   'unit': 'Floor 2',
#   'url': 'http://streeteasy.com/nyc/sale/1234567',
#   'price': 55000000
# }]