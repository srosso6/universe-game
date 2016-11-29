require("minitest/autorun")
require("minitest/rg")
require_relative("../planet.rb")

class TestPlanet < Minitest::Test

  def setup

  @LV426 = Planet.new("LV426", 10)
  @ice_pop = Planet.new("ice pop", 20)
  @new_wave = Planet.new("new wave", 20)
  @big_fizz = Planet.new("big fizz", 50)

  end

  def test_planet_name
    assert_equal("LV426", @LV426.planet_name)
  end

  def test_fuel_price
    assert_equal(10, @LV426.fuel_price)
  end


end
