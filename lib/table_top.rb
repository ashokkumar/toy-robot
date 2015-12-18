class TableTop
  def initialize(length, breath)
    @length = length
    @breath = breath
  end

  def has_coordinate?(coordinate)
    coordinate.x <= @length && coordinate.y <= @breath
  end
end