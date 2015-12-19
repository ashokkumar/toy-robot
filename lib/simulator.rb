require './lib/table_top'
require './lib/direction'
require './lib/location'
require './lib/coordinate'
require './lib/direction'
require './lib/robot'

class Simulator
  VALID_COMMANDS = ['PLACE', 'REPORT', 'MOVE', 'LEFT', 'RIGHT']

  def initialize(table_top, robot)
    @table_top = table_top
    @robot = robot
  end

  def execute(input)
    operator, arguments = process_input(input)
    valid_command?(operator) && execute_cmd(operator.downcase, arguments)
  end

  private

  def valid_command?(command)
    VALID_COMMANDS.include? command
  end

  def process_input(input)
    tokens = input.split(/\s+/)
    if tokens.first && tokens.first == VALID_COMMANDS.first
      [tokens.first, convert_to_location(tokens.last)].flatten
    else
      tokens.first
    end
  end

  def convert_to_location(args_str)
    values = args_str.split(",")
    [Location.new(Coordinate.new(values[0].to_i, values[1].to_i), Direction.const_get(values[2]), @table_top)]
  end

  def execute_cmd(*cmd)
    @robot.send(*cmd.compact)
  end
end