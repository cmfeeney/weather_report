class WeatherReport
  attr_reader :state, :response
  def initialize(city, state)
    @city = city
    @state = state
    @response = HTTParty.get("http://api.wunderground.com/api/KEY_GOES_HERE/conditions/q/#{state}/#{city}.json")
    @current = @response["current_observation"]
    puts @current
  end

  def city()
    @city.gsub!("_"," ")
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
