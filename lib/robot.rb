class Robot
  INVALID_LOCATION_MSG = "Not placed on table top yet!!!"
  
  def place(location)
    @location = location if location.valid?
  end

  def report
    @location ? @location.to_s : INVALID_LOCATION_MSG
  end

  [:left, :right, :move].each do |method|
    define_method method do
      @location = @location.send(method) if @location
    end
  end
end