module CoordinateDirection 
  DIRECTION = Struct.new(:name, :coordinate_delta)
  COORDINATE = Struct.new(:x_coordinate, :y_coordinate)
  def direction(name, coordinate_delta)    
    DIRECTION.new(name, coordinate_delta)
  end

  def coordinate(x_coordinate, y_coordinate)    
    COORDINATE.new(x_coordinate, y_coordinate)
  end

  def directions
    {
     north: direction("NORTH", coordinate(0,1)),
     south: direction("SOUTH", coordinate(0,-1)),
     west: direction("WEST", coordinate(-1,0)),
     east: direction("EAST", coordinate(1,0))
    }
  end
end
