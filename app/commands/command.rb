module Commands
  class Command
    def initialize(robot, table, position = nil)
      @robot = robot
      @table = table
      @position = position
      run
    end

    def run
      raise InvalidCommandSequenceError.new "Invalid command sequence #{extract_class_name}" unless @robot.valid_position?
    end

    private

    def extract_class_name
      self.class.name.split('::').last
    end

  end
end
