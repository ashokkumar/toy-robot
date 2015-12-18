module CoordinateDirection 
  
  COORDINATE = Struct.new(:x_coordinate, :y_coordinate)

  DIRECTION = Struct.new(:name, :coordinate_delta, :on_left, :on_right) do

    def left
      directions[on_left]
    end

    def right
      directions[on_right]
    end

  end

  def coordinate(x_coordinate, y_coordinate)    
    COORDINATE.new(x_coordinate, y_coordinate)
  end

  def direction(name, coordinate_delta, left, right)
    DIRECTION.new(name, coordinate_delta, left, right)
  end

  def directions
    {
     north: direction("NORTH", coordinate(0,1), "WEST", "EAST"),
     south: direction("SOUTH", coordinate(0,-1), "EAST", "WEST"),
     west: direction("WEST", coordinate(-1,0), "SOUTH", "NORTH"),
     east: direction("EAST", coordinate(1,0), "NORTH", "SOUTH")
    }
  end

end
