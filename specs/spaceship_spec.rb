require("minitest/autorun")
require("minitest/rg")
require_relative("../spaceship.rb")

class TestSpaceship < Minitest::Test

  def setup
    @firefly = Spaceship.new( name: "Firefly", position: 2, fuel_level: 50, fuel_per_lightyear: 10 )
    @waspy = Spaceship.new( name: "Waspy", position: 6, fuel_level: 40, fuel_per_lightyear: 5 )
    @bf_rescue = Spaceship.new( name: "big_fizz_rescue", position: 18, fuel_level: 100, fuel_per_lightyear: 1)
  end

  def test_spaceship_name
    assert_equal("Firefly", @firefly.spaceship_name)
  end

  def test_move_spaceship_forward
    @firefly.move(1)
    assert_equal(3, @firefly.position)
    assert_equal(40, @firefly.fuel_level)
  end

  def test_move_spaceship_backward
    @firefly.move(-1)
    assert_equal(1, @firefly.position)
    assert_equal(40, @firefly.fuel_level)
  end

  def test_refuel
    @firefly.move(1)
    @firefly.refuel()
    assert_equal(50, @firefly.fuel_level)
  end

  def test_max_fuel
    @firefly.refuel()
    assert_equal(50, @firefly.fuel_level)
  end


end
