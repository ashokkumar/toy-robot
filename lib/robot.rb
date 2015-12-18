class Robot

  INVALID_LOCATION_MSG = "Not placed Yet!!!"
  
  def place(location)
    @location = location if location.valid?
  end

  def report
    @location ? @location.to_s : INVALID_LOCATION_MSG
  end

  def left
    @location = @location.left
  end

  def right
    @location = @location.right
  end

  def move
    @location = @location.move
  end
end