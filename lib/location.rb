require './lib/coordinate_direction'

class Location
  include CoordinateDirection


  def initialize(x_coordinate, y_coordinate, direction, table_top)
    @coordinate = coordinate(x_coordinate, y_coordinate)
    @direction = directions[direction.downcase.to_sym]
    @table_top = table_top
  end

  def move
    Location.new(@coordinate.x_coordinate + @direction.coordinate_delta.x_coordinate, 
                 @coordinate.y_coordinate + @direction.coordinate_delta.y_coordinate, 
                 @direction.name, @table_top)
  end

  def left
    Location.new(@coordinate.x_coordinate, @coordinate.y_coordinate, @direction.on_left, @table_top)
  end

  def right
    Location.new(@coordinate.x_coordinate, @coordinate.y_coordinate, @direction.on_right, @table_top)
  end

  def valid?
    table_top.has_coordinate?(@coordinate)
  end

  def to_s
    "#{@coordinate.x_coordinate},#{@coordinate.y_coordinate},#{@direction.name}"
  end
end