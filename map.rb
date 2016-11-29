require("pry-byebug")

class Map

  attr_accessor :space

  def initialize(size, positions)
    @space = Array.new(size, {})
    for key in positions.keys
      @space[key] = positions[key]
    end

  end

  def star_position
    return @space.length - 1
  end


  def position_planet?(index)
    @space[index].has_key?(:planet)
  end


  def position_wormhole?(index)
    @space[index].has_key?(:wormhole)
  end

end
