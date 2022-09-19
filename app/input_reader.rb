require 'byebug'
# require 'commands/command'
class InputReader
  VALID_COMMANDS = %w[left right move report].freeze
  PLACE_CMD_REGEX = /^\d+,+(\s)*+\d+,+(\s)*+[a-zA-Z]+(\s)*+$/.freeze

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def parse_command(raw_string)
    execute(raw_string.strip)
  rescue InvalidCommandError => e
    # do nothing
    puts "Info: #{e}"
  rescue InvalidCommandSequenceError => e
    # do nothing
    puts "Info: #{e}"
  end

  private

  def execute(command_str)
    return if command_str.empty?

    command, args = command_str.strip.downcase.split(/\s+/, 2)
    case command
    when 'place'
      validate_place_command(args)
      args = args.gsub(/\s/, '').split(',')
      Commands::Place.new(@robot, @table, Position.new(*cast_to_int(args)))
    when *VALID_COMMANDS
      Object.const_get("Commands::#{command.capitalize}").new(@robot, @table)
    else
      raise InvalidCommandError, "#{command} is not valid command"
    end
  end

  def cast_to_int(str_ar)
    str_ar.map do |str|
      /\A\d+\Z/.match(str) ? str.to_i : str
    end
  end

  def validate_place_command(args)
    raise InvalidCommandError, 'PLACE X,Y,F format not supplied' unless args =~ PLACE_CMD_REGEX
  end
end
