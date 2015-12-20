require 'spec_helper'

describe Direction do

  it "should return the left side direction of given direction" do
    expect(Direction::SOUTH.left).to eq(Direction::EAST)
  end

  it "should return the right side direction of given direction" do
    expect(Direction::SOUTH.right).to eq(Direction::WEST)
  end

  it "should return the new coordinate based on the coordinate_delta" do    
    expect(Direction::NORTH.move(Coordinate.new(0, 0)).to_s).to eq("0,1")
  end

  it "should return the name of the direction for to_s" do
    expect(Direction::WEST.to_s).to eq("WEST")
  end

end