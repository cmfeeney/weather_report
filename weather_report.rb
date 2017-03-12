require 'httparty'
require 'yaml'

class WeatherReport
  attr_reader :response
  def initialize(city, state)
    file = YAML.load_file('./config.yaml')
    key = file["development"]["key"]
    @city = city
    @state = state
    @response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{state}/#{city}.json")
    @current = @response["current_observation"]
  end

  def city_state()
    @current["display_location"]["full"]
  end

  def city()
    @current["display_location"]["city"]
  end

  def state()
    @current["display_location"]["state"]
  end

  def temp()
    @current["temp_f"]
  end

  def temp_feels_like()
    @current["feelslike_f"]
  end

  def weather()
    @current["weather"].downcase
  end

  def wind_speed()
    @current["wind_mph"]
  end

  def wind_dir()
    @current["wind_dir"]
  end
end
