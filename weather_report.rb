class WeatherReport
  attr_reader :city, :state, :response
  def initialize(city, state)
    @city = city
    @state = state
    @response = HTTParty.get("http://api.wunderground.com/api/KEY_GOES_HERE/conditions/q/#{state}/#{city}.json")
    @current = @response["current_observation"]
    puts @response
  end
end
