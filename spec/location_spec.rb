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
  end
end