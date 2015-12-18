require 'spec_helper'

describe Direction do

  it "should return the left side direction" do
    directions = [Direction::EAST, Direction::NORTH, Direction::WEST, Direction::SOUTH]
    direction = Direction::SOUTH
    4.times do |index|
      direction = direction.left
      expect(direction).to eq(directions[index])
    end
  end

  it "should return the right side direction" do
    directions = [Direction::EAST, Direction::SOUTH, Direction::WEST, Direction::NORTH]
    direction = Direction::NORTH
    4.times do |index|
      direction = direction.right
      expect(direction).to eq(directions[index])
    end
  end

end