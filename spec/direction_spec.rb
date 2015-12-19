require 'spec_helper'

describe Direction do

  it "should return the left side direction" do
    expect(Direction::SOUTH.left).to eq(Direction::EAST)
  end

  it "should return the right side direction" do
    expect(Direction::SOUTH.right).to eq(Direction::WEST)
  end

end