class Universe

  def initialize(map, spaceships)
    @map = map
    @spaceships = spaceships
  end

  def refuel_on_planet()
    for spaceship in @spaceships
      if @map.position_planet?(spaceship.position)
      spaceship.refuel
      end
    end
  end


  def move_through_wormhole()
    for spaceship in @spaceships
      if @map.position_wormhole?(spaceship.position)
        spaceship.jump(@map.space[spaceship.position][:wormhole])   # made jump - a diff version of move method
      end
    end
  end

  def transfer_fuel()
    @spaceships[2].fuel_level -= 20
    @spaceships[0].fuel_level += 20
  end

end
