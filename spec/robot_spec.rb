require "spec_helper"

describe Robot do
  let(:robot) {Robot.new}
  it "should place the robot in the given location" do
    robot.place(Location.new(2,3,"SOUTH"))
    expect(robot.report).to eq("2,3,SOUTH")
  end
end