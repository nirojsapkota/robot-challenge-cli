require_relative 'table'
require_relative 'robot'
require_relative 'input_reader'
require_relative 'commands/command'
require_relative 'position'
require_relative 'commands/place'
require_relative 'commands/move'
require_relative 'commands/left'
require_relative 'commands/report'
require_relative 'commands/right'
require_relative 'handlers/invalid_command_error'
require_relative 'handlers/invalid_command_sequence_error'

require_relative 'validators/valid_command_sequence.rb'

table = Table.new(5,5)
robot = Robot.new
InputReader.new(robot, table).read_file(ARGF)
