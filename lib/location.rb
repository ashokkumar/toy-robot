require './lib/coordinate_direction'

class Location
  include CoordinateDirection


  def initialize(x_coordinate, y_coordinate, direction)
    @coordinate = coordinate(x_coordinate, y_coordinate)
    @direction = directions[direction.downcase.to_sym]
  end

  def move
    Location.new(@coordinate.x_coordinate + @direction.coordinate_delta.x_coordinate, 
                 @coordinate.y_coordinate + @direction.coordinate_delta.y_coordinate, 
                 @direction.name)
  end

  def left
    Location.new(@coordinate.x_coordinate, @coordinate.y_coordinate, @direction.on_left)
  end

  def right
    Location.new(@coordinate.x_coordinate, @coordinate.y_coordinate, @direction.on_right)
  end

  def to_s
    "#{@coordinate.x_coordinate},#{@coordinate.y_coordinate},#{@direction.name}"
  end
end