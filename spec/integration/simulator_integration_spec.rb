require 'spec_helper'

describe Simulator do
  let(:simulator){Simulator.new(TableTop.new(5, 5), Robot.new)}

  describe "valid commands" do
    it "should place the robot in the given coordinate and direction" do
      simulator.execute("PLACE 0,0,NORTH")
      expect(simulator.execute("REPORT")).to eq("0,0,NORTH")
    end

    it "should move the robot from the given coordinate and direction" do
      simulator.execute("PLACE 0,0,NORTH")
      simulator.execute("MOVE")
      expect(simulator.execute("REPORT")).to eq("0,1,NORTH")
    end

    it "should turn the robot left from the given coordinate and direction" do
      simulator.execute("PLACE 0,0,NORTH")
      simulator.execute("LEFT")
      expect(simulator.execute("REPORT")).to eq("0,0,WEST")
    end

    it "should turn the robot right from the given coordinate and direction" do
      simulator.execute("PLACE 0,0,NORTH")
      simulator.execute("RIGHT")
      expect(simulator.execute("REPORT")).to eq("0,0,EAST")
    end
  end  

end