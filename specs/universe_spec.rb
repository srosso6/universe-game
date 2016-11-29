require("minitest/autorun")
require("minitest/rg")
require_relative("../map.rb")
require_relative("../spaceship.rb")
require_relative("../planet.rb")
require_relative("../universe.rb")


class TestUniverse < Minitest::Test

  def setup

    @LV426 = Planet.new("LV426", 10)
    @ice_pop = Planet.new("ice pop", 20)
    @new_wave = Planet.new("new wave", 20)
    @big_fizz = Planet.new("big fizz", 50)

    positions = {
      0 => {planet: @ice_pop},
      1 => {wormhole: 15},
      2 => {planet: @LV426},
      6 => {planet: @new_wave},
      18 => {planet: @big_fizz}
    }

    @map = Map.new( 20, positions)
    @firefly = Spaceship.new( name: "Firefly", position: 2, fuel_level: 50, fuel_per_lightyear: 10 )
    @waspy = Spaceship.new( name: "Waspy", position: 6, fuel_level: 40, fuel_per_lightyear: 5 )
    @bf_rescue = Spaceship.new( name: "big_fizz_rescue", position: 18, fuel_level: 100, fuel_per_lightyear: 1)

    @spaceships = [@firefly, @waspy, @bf_rescue]

    @universe = Universe.new(@map, @spaceships)

  end


  def test_refuel_if_planet
    @firefly.move(4)
    @universe.refuel_on_planet()
    assert_equal(50, @firefly.fuel_level)
  end

  def test_not_refuel_if_not_planet
    @firefly.move(3)
    @universe.refuel_on_planet()
    assert_equal(20, @firefly.fuel_level)
  end

  def test_move_if_wormhole
    @firefly.move(-1)
    @universe.move_through_wormhole()
    assert_equal(16, @firefly.position)
    assert_equal(40, @firefly.fuel_level)
  end

  def test_transfer_fuel()
    @universe.transfer_fuel()
    assert_equal(20, @firefly.fuel_level)
  end


end
