require 'readline'
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

TABLE_LENGTH = 5
TABLE_WIDTH = 5

table = Table.new(TABLE_LENGTH, TABLE_WIDTH)
robot = Robot.new

prompt = '> '
puts <<~HEREDOC
  Initialized table with #{TABLE_LENGTH} and #{TABLE_WIDTH}
  valid commands are
  1. PLACE X,Y,F
  2. MOVE
  3. LEFT
  4. RIGHT
  5. REPORT
  6. CTRL + C to exit
  START simulating.............
HEREDOC

reader = InputReader.new(robot, table)
while (buffer = Readline.readline(prompt, true))
  reader.parse_command(buffer)
end
