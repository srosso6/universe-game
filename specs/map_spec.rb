require("minitest/autorun")
require("minitest/rg")
require_relative("../map.rb")
require_relative("../spaceship.rb")
require_relative("../planet.rb")


class TestMap < Minitest::Test

  def setup
    @LV426 = Planet.new("LV426", 10)
    @ice_pop = Planet.new("ice pop", 20)
    @new_wave = Planet.new("new wave", 20)
    @big_fizz = Planet.new("big fizz", 50)

    positions = {
      0 => {planet: @ice_pop},
      1 => {wormhole: 15},
      2 => {planet: @LV246},
      6 => {planet: @new_wave},
      18 => {planet: @big_fizz}
    }

    @map = Map.new( 20, positions)
  end

  def test_map_has_20_light_years
    assert_equal( 20, @map.space.size)
  end

  def test_light_year_1_is_wormhole
    assert_equal( 16, @map.space[1][:wormhole])
  end

  def test_planet_exists
    assert_equal(@ice_pop, @map.space[0][:planet])
    assert_equal(@LV246, @map.space[2][:planet])
    assert_equal(@new_wave, @map.space[6][:planet])
    assert_equal(@big_fizz, @map.space[18][:planet])
  end

  def test_star_position
    assert_equal( 19, @map.star_position)
  end

  def test_position_planet?
    assert_equal( true, @map.position_planet?(2))
    assert_equal( false, @map.position_planet?(3))
  end

  def test_position_wormhole?
    assert_equal( true, @map.position_wormhole?(2))
    assert_equal( false, @map.position_wormhole?(3))
  end


end
