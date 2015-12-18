require './lib/coordinate'

class Direction  
  def initialize(name, coordinate_delta)
    @name = name
    @coordinate_delta = coordinate_delta
  end

  def move(coordinate)
    coordinate + @coordinate_delta
  end

  def left
    direction_order[(direction_index + 1) % direction_order.size] 
  end

  def right
    direction_order[direction_index - 1]
  end

  def to_s
    @name
  end

  NORTH = Direction.new("NORTH", Coordinate.new(0, 1))
  SOUTH = Direction.new("SOUTH", Coordinate.new(0, -1))
  WEST = Direction.new("WEST", Coordinate.new(-1, 0))
  EAST = Direction.new("EAST", Coordinate.new(1, 0))

  private
  def direction_order
    [EAST, NORTH, WEST, SOUTH]
  end

  def direction_index
    direction_order.index(self)
  end
end