class Location
  def initialize(x_coordinate, y_coordinate, direction)
    @coordinated = Coordinate.new(x_coordinate, y_coordinate)
    @direction = Direction.const_get(direction)
  end

  def to_s
    "#{@coordinated.to_s},#{@direction.to_s}"
  end

  class Coordinate
    def initialize(x_coordinate, y_coordinate)
      @x_coordinate = x_coordinate
      @y_coordinate = y_coordinate
    end

    def to_s
      "#{@x_coordinate},#{@y_coordinate}"
    end
  end

  class Direction
    def initialize(name)
      @name = name
    end

    def to_s
      @name
    end

    NORTH = Direction.new("NORTH")
    SOUTH = Direction.new("SOUTH")
    WEST = Direction.new("WEST")
    EAST = Direction.new("EAST")
  end
end