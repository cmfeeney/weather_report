require 'httparty'
require './weather_report.rb'
require 'yaml'

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
  file = YAML.load_file('./config.yaml')
  key = file["development"]["key"]
  geolookup = HTTParty.get("http://api.wunderground.com/api/#{key}/geolookup/q/#{zip}.json")
  city = geolookup["location"]["city"]
  city.gsub!(" ","_")
  state = geolookup["location"]["state"]
  location = WeatherReport.new(city, state, key)
  conditions(location)
end

def conditions(location)
  puts "Current weather conditions for #{location.city_state}: "
  puts "It is #{location.weather} outside."
  puts "The temperature is #{location.temp} and it feels like #{location.temp_feels_like}."
  puts "Winds are blowing at #{location.wind_speed} MPH from the #{location.wind_dir}."
end

puts 'Welcome to the Weather Report App!'
enter_zip()
