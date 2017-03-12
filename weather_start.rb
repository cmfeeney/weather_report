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
  location = WeatherReport.new(city, state)
  conditions(location)
end

def conditions(location)
  puts "Current weather conditions for #{location.city}, #{location.state}: "
  puts "It is #{location.weather} outside."
  puts "The temperature is #{location.temp} and it feels like #{location.temp_feels_like}."
  puts "Winds blowing at #{location.wind_speed} MPH from the #{location.wind_dir}."
end

puts 'Welcome to the Weather Report App!'
enter_zip()






#Once get city and state info from zip endpoint, use that to instantiate object of city class
#define methods to get current condtions and then puts them out
