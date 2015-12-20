require 'spec_helper'

describe TableTop do
  let(:table){TableTop.new(3, 3)}
  
  describe "valid" do
    it "should return true if given x and y coordinate is with in the table top's length" do
      coordinate = Coordinate.new(3, 2)
      expect(table.has_coordinate?(coordinate)).to be_truthy
    end
  end

  describe "in valid" do
    it "should return false if x is more than table top's length" do
      coordinate = Coordinate.new(4, 2)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end

    it "should return false if y is more than table top's breath" do
      coordinate = Coordinate.new(2, 4)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end

    it "should return false if x is less than 0" do
      coordinate = Coordinate.new(-1, 0)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end

    it "should return false if y is less than 0" do
      coordinate = Coordinate.new(0, -1)
      expect(table.has_coordinate?(coordinate)).to be_falsy
    end
  end

end