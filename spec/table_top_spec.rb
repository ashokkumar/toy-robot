require 'spec_helper'

describe TableTop do
  let(:table){TableTop.new(3, 3)}
  
  describe "valid" do
    it "should return true if given x and y coordinate is with in the table top - x" do
      coordinate = Coordinate.new(3, 2)
      expect(table.has_coordinate?(coordinate)).to be_truthy
    end

    it "should return true if given x and y coordinate is with in the table top - y" do
      coordinate = Coordinate.new(2, 3)
      expect(table.has_coordinate?(coordinate)).to be_truthy
    end
  end

  describe "in valid" do
    it "should return true if either x and y coordinate is not with in the table top - x" do
      coordinate = Coordinate.new(4, 2)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end

    it "should return true if either x and y coordinate is not with in the table top - y" do
      coordinate = Coordinate.new(2, 4)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end
  end

end