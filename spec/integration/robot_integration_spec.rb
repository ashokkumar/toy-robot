require 'spec_helper'

describe Robot do
  let(:table_top){TableTop.new(5, 5)}  
  let(:robot){Robot.new}

# ### Example a

#     PLACE 0,0,NORTH
#     MOVE
#     REPORT

# Expected output:

#     0,1,NORTH
  it "should able to move to the location 0,1,NORTH " do
    robot.place(Location.new(Coordinate.new(0, 0), Direction::NORTH, table_top))
    robot.move
    expect(robot.report).to eq("0,1,NORTH")
  end


# ### Example b

#     PLACE 0,0,NORTH
#     LEFT
#     REPORT

# Expected output:

#     0,0,WEST
  it "should able to move to the location 0,0,WEST " do
    robot.place(Location.new(Coordinate.new(0, 0), Direction::NORTH, table_top))
    robot.left
    expect(robot.report).to eq("0,0,WEST")
  end

#   ### Example c

#     PLACE 1,2,EAST
#     MOVE
#     MOVE
#     LEFT
#     MOVE
#     REPORT

# Expected output

#     3,3,NORTH
  it "should able to move to the location 3,3,NORTH " do
    robot.place(Location.new(Coordinate.new(1, 2), Direction::EAST, table_top))
    robot.move
    robot.move
    robot.left
    robot.move
    expect(robot.report).to eq("3,3,NORTH")
  end

# - The toy robot must not fall off the table during movement. This also
#   includes the initial placement of the toy robot.
# - Any move that would cause the robot to fall must be ignored.

  it "should not fall out of the table_top " do
    robot.place(Location.new(Coordinate.new(5, 4), Direction::NORTH, table_top))
    5.times{robot.move}  
    expect(robot.report).to eq("5,5,NORTH")
  end

  it "shoud not fall out even in the initial load" do
    robot.place(Location.new(Coordinate.new(5, 6), Direction::NORTH, table_top))
    expect(robot.report).to eq("Not placed Yet!!!")
  end


end