require "spec_helper"

describe Robot do
  let(:robot) {Robot.new}
  let(:location) {Location.new(2,3,"SOUTH")}
  before do
    robot.place(location)
  end

  describe 'place' do
    it "should place the robot in the given location" do      
      expect(robot.report).to eq("2,3,SOUTH")
    end
  end

  describe 'move' do
    it "should change the location of the robot" do      
      expect(location).to receive(:move)      
      robot.move
    end
  end

  describe 'turn' do
    it "should turn the robot to left" do
      expect(location).to receive(:left)
      robot.left
    end
  end
  
end