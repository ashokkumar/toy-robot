require './lib/coordinate'

class Location
  def initialize(coordinate, direction, table_top)
    @coordinate = coordinate
    @direction = direction
    @table_top = table_top
  end

  def move
    Location.new(@direction.move(@coordinate), @direction, @table_top)
  end

  def left
    Location.new(@coordinate, @direction.left, @table_top)
  end

  def right
    Location.new(@coordinate, @direction.right, @table_top)
  end

  def to_s
    "#{@coordinate.to_s},#{@direction.to_s}"
  end
end