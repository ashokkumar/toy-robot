require "spec_helper"

describe Robot do
  let(:robot) {Robot.new}
  let(:table_top) {TableTop.new(3,3)}
  let(:location) {Location.new(Coordinate.new(2,3), Direction::SOUTH, table_top)}
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
      expected_location = Location.new(Coordinate.new(1,3), Direction::SOUTH, table_top)     
      expect(location).to receive(:move).and_return(expected_location)
      robot.move
      expect(robot.report).to eq("1,3,SOUTH")
    end
  end

  describe 'turn' do
    it "should turn the robot to left" do
      expected_location = Location.new(Coordinate.new(2,3), Direction::WEST, table_top)
      expect(location).to receive(:left).and_return(expected_location)
      robot.left
      expect(robot.report).to eq("2,3,WEST")
    end

    it "should turn the robot to right" do
      expected_location = Location.new(Coordinate.new(2,3), Direction::EAST, table_top)
      expect(location).to receive(:right).and_return(expected_location)
      robot.right
      expect(robot.report).to eq("2,3,EAST")
    end
  end
  
end