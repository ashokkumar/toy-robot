require './lib/coordinate'

class Location
  def initialize(coordinate, direction, table_top)
    @coordinate = coordinate
    @direction = direction
    @table_top = table_top
  end

  def move
    new_location = Location.new(@direction.move(@coordinate), @direction, @table_top)
    new_location.valid? ? new_location : self
  end

  def left
    Location.new(@coordinate, @direction.left, @table_top)
  end

  def right
    Location.new(@coordinate, @direction.right, @table_top)
  end

  def valid?
    @table_top.has_coordinate?(@coordinate)
  end

  def to_s
    "#{@coordinate.to_s},#{@direction.to_s}"
  end
end