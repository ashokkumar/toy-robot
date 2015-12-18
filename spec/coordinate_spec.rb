require 'spec_helper'

describe Coordinate do
  it "should add given Coordiante and return new Coordiante" do
    expect(Coordinate.new(1,2) + Coordinate.new(-1,0)).to eq(Coordinate.new(0,2))
  end
end