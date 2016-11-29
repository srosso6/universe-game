require_relative("map.rb")
require_relative("spaceship.rb")
require_relative("planet.rb")
require_relative("universe.rb")


LV426 = Planet.new("LV426", 10)
ice_pop = Planet.new("ice pop", 20)
new_wave = Planet.new("new wave", 20)
big_fizz = Planet.new("big fizz", 50)

positions = {
  0 => {planet: ice_pop},
  1 => {wormhole: 15},
  2 => {planet: LV426},
  6 => {planet: new_wave},
  18 => {planet: big_fizz}
}

map = Map.new( 20, positions)
firefly = Spaceship.new( name: "Firefly", position: 2, fuel_level: 50, fuel_per_lightyear: 10 )
waspy = Spaceship.new( name: "Waspy", position: 6, fuel_level: 40, fuel_per_lightyear: 5 )
bf_rescue = Spaceship.new( name: "big_fizz_rescue", position: 18, fuel_level: 100, fuel_per_lightyear: 1)

spaceships = [firefly, waspy, bf_rescue]

universe = Universe.new(map, spaceships)

puts "------"

puts "Firefly is at planet LV426 with a fuel level of #{firefly.fuel_level}"

puts "------"

firefly.move(4)
puts "Firefly moves 4 light years"

puts "------"

puts "Firefly has landed at planet New Wave and has a fuel level of #{firefly.fuel_level}"

puts "------"

universe.refuel_on_planet
puts "Firefly will re-fuel at New Wave"
puts "Firefly now has a fuel level of #{firefly.fuel_level}"

puts "------"

firefly.move(-5)
puts "Firefly moves 5 light years"

puts "------"

universe.move_through_wormhole
puts "Firefly hits a wormhole and ends up 15 light years away!"

puts "------"

puts "Oh no! Firefly is now stranded in space with no fuel. Fuel level = #{firefly.fuel_level}"

puts "------"

bf_rescue.move(-3)
puts "Big Fizz Rescue services are on the move to rescue Firefly"
