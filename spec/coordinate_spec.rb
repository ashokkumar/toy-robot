require 'spec_helper'

describe Coordinate do
  it "should add given coordiantes and return new coordiante" do
    coordinate = Coordinate.new(1, 2)
    other_coordinate = Coordinate.new(-1, 0)
    new_coordinate = coordinate + other_coordinate
    
    expect(new_coordinate).to be_a(Coordinate)
    expect(new_coordinate).not_to be(coordinate)
    expect(new_coordinate).not_to be(other_coordinate)
    expect(new_coordinate.x).to eq(coordinate.x + other_coordinate.x)
    expect(new_coordinate.y).to eq(coordinate.y + other_coordinate.y)
  end

  it "should return the x and y for to_s" do
    expect(Coordinate.new(1, 2).to_s).to eq("1,2")
  end
end