require './lib/coordinate'

class Direction  
  def initialize(name, coordinate_delta, on_left, on_right)
    @name = name
    @coordinate_delta = coordinate_delta
    @on_left = on_left
    @on_right = on_right
  end

  def move(coordinate)
    coordinate + @coordinate_delta
  end

  def left
    Direction.const_get(@on_left)
  end

  def right
    Direction.const_get(@on_right)
  end

  def to_s
    @name
  end

  NORTH = Direction.new("NORTH", Coordinate.new(0,1), "WEST", "EAST")
  SOUTH = Direction.new("SOUTH", Coordinate.new(0,-1), "EAST", "WEST")
  WEST = Direction.new("WEST", Coordinate.new(-1,0), "SOUTH", "NORTH")
  EAST = Direction.new("EAST", Coordinate.new(1,0), "NORTH", "SOUTH")
end