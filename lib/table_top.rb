class TableTop
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
    @lowest_length = 0
    @lowest_breadth = 0
  end

  def has_coordinate?(coordinate)
    coordinate.x.between?(@lowest_breadth, @length) && coordinate.y.between?(@lowest_breadth, @breadth)
  end
end