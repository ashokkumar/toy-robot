require 'spec_helper'

describe Location do  
  let(:location) {Location.new(Coordinate.new(2,2), Direction::NORTH, TableTop.new(3,3))}

  describe "initialize" do
    it "should create location instance with coordinate direction and table_top" do
      expect(location.to_s).to eq("2,2,NORTH")
    end
  end

  describe "move" do
    it "should move to the next location based on direction" do
      expect(location.move.to_s).to eq("2,3,NORTH")
    end

    it "should turn left and move to the respective location based on new direction" do
      new_location = location.left
      expect(new_location.move.to_s).to eq("1,2,WEST")
    end
  end

  describe "left" do
    it "should change direction of the location based on current location" do
      expect(location.left.to_s).to eq("2,2,WEST")
    end
  end

  describe "right" do
    it "should change direction of the location based on current location" do
      expect(location.right.to_s).to eq("2,2,EAST")
    end
  end

  describe "valid?" do
    it "should validate the coordinate based on the table_top" do
      table_top = TableTop.new(3,3)
      coodrinate = Coordinate.new(3,4)
      invalid_location = Location.new(coodrinate, Direction::NORTH, table_top)
      expect(table_top).to receive(:has_coordinate?).with(coodrinate).and_return(false)
      expect(invalid_location).not_to be_valid
    end
  end
 end