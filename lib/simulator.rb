require './lib/table_top'
require './lib/direction'
require './lib/location'
require './lib/coordinate'
require './lib/direction'
require './lib/robot'

class Simulator
  COMMAND_WITH_ARGS = 'PLACE'
  OTHER_COMMANDS = ['REPORT', 'MOVE', 'LEFT', 'RIGHT']

  def initialize(table_top, robot)
    @table_top = table_top
    @robot = robot
  end

  def execute(input)
    operator, args = process_input(input)
    valid_command?(operator, args) && execute_cmd(operator.downcase, convert_to_location(args))
  end

  private

  def valid_command?(command, args)
    (COMMAND_WITH_ARGS == command && validate_args(args)) || OTHER_COMMANDS.include?(command)
  end

  def validate_args(args)
    args =~ /^\d,\d,\w*$/ && Direction.constants.include?(args.split(",").last.to_sym)
  end

  def process_input(input)
    input.split(/\s+/)
  end

  def convert_to_location(args_str)
    if args_str
      values = args_str.split(",")
      Location.new(Coordinate.new(values[0].to_i, values[1].to_i), Direction.const_get(values[2]), @table_top)
    end
  end

  def execute_cmd(*cmd)
    @robot.send(*cmd.compact)
  end
end