class Robot

  def place(location)
    @location = location
  end

  def report
    @location.to_s
  end

  def left
    @location.left
  end

  def move
    @location = @location.move
  end
end