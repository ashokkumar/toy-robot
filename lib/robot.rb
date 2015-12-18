class Robot
  INVALID_LOCATION_MSG = "Not placed on table top yet!!!"
  
  def place(location)
    @location = location if location.valid?
  end

  def report
    @location ? @location.to_s : INVALID_LOCATION_MSG
  end

  def left
    @location = @location.left if @location
  end

  def right
    @location = @location.right if @location
  end

  def move
    @location = @location.move if @location
  end
end