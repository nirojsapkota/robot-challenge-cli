module Commands
  class Move < Command
    def run
      super
      next_position = @robot.current_position.move

      @robot.current_position = next_position if @table.position_valid?(next_position)
    end
  end
end
