require 'minitest/pride'
require 'minitest/autorun'
require './weather_report.rb'

#Test to make sure zip returns correct city and state
class WeatherReportTest < Minitest::Test

  def setup
    @durham = WeatherReport.new("Durham", "NC")
    @san_fran = WeatherReport.new("San_Francisco", "CA")
  end

  def test_weather_creation
    @durham
  end

  def test_city
    assert @durham.city == "Durham"
    refute @durham.city == "Chapel Hill"
    assert @san_fran.city == "San Francisco"
    refute @san_fran.city == "San_Francisco"
  end

  def test_state
    assert @durham.state == "NC"
    refute @durham.state == "GA"
  end
end
