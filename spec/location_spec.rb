require 'spec_helper'

describe Location do
  let(:location) {Location.new(2,3,"NORTH")}

  describe "initialize" do
    it "should create location instance with coordinate and direction" do      
      expect(location.to_s).to eq("2,3,NORTH")
    end
  end

  describe "move" do
    it "should move to the next location based on direction" do      
      expect(location.move.to_s).to eq("2,4,NORTH")
    end

    it "should turn and move to the respective location based on new direction" do
      new_location = location.left
      expect(new_location.move.to_s).to eq("1,3,WEST")
    end
  end

  describe "left" do
    it "should change direction of the location based on current location" do
      left_location = location.left
      expect(left_location.to_s).to eq("2,3,WEST")
      expect(left_location.left.to_s).to eq("2,3,SOUTH")
    end
  end
  
end