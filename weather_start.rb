require 'httparty'
require './weather_report.rb'

def enter_zip()
  puts 'Please enter a zip code: '
  zip = gets.chomp
  validate_zip(zip.to_s)
end

def validate_zip(zip)
  if zip.match(/^\d{5}$/) == nil
    puts 'Not a valid zip code. Try again.'
    enter_zip()
  else
    zip_lookup(zip)
  end
end

def zip_lookup(zip)
  geolookup = HTTParty.get("http://api.wunderground.com/api/KEY_GOES_HERE/geolookup/q/#{zip}.json")
  city = geolookup["location"]["city"]
  city.gsub!(" ","_")
  state = geolookup["location"]["state"]
  WeatherReport.new(city, state)
end

puts 'Welcome to the Weather Report App!'
enter_zip()






#Once get city and state info from zip endpoint, use that to instantiate object of city class
#define methods to get current condtions and then puts them out
