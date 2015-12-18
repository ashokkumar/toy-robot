require './lib/coordinate'
require './lib/direction'
require './lib/table_top'

class Location
  def initialize(coordinate, direction, table_top)
    @coordinate = coordinate
    @direction = direction
    @table_top = table_top
  end

  def move
    new_location = new_location({coordinate: @direction.move(@coordinate)})
    new_location.valid? ? new_location : self
  end

  def left
    new_location({direction: @direction.left})
  end

  def right
    new_location({direction: @direction.right})
  end

  def valid?
    (@table_top.is_a?(TableTop) && @table_top.has_coordinate?(@coordinate) && @direction.is_a?(Direction))
  end

  def to_s
    "#{@coordinate.to_s},#{@direction.to_s}"
  end

  private
  def new_location(options)
    Location.new(options[:coordinate] || @coordinate,
                 options[:direction] || @direction,
                 options[:table_top] || @table_top)
  end

end