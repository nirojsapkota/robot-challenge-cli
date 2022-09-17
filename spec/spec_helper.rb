require 'byebug'
require_relative '../app/robot'
require_relative '../app/position'
require_relative '../app/table'
require_relative '../app/commands/command'
require_relative '../app/commands/left'
require_relative '../app/commands/right'
require_relative '../app/commands/move'
require_relative '../app/commands/report'
require_relative '../app/commands/place'
require_relative '../app/handlers/invalid_command_sequence_error'
require_relative '../app/handlers/invalid_command_error'

require_relative 'support/shared_examples_for_direction'
require_relative 'support/shared_examples_for_move'