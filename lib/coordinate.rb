class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other_coordinate)
    Coordinate.new(@x + other_coordinate.x, @y + other_coordinate.y)
  end

  def to_s
    "#{x},#{y}"
  end
end