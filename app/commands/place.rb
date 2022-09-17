module Commands
  class Place < Command
    def run
      @robot.current_position = @position if @table.position_valid?(@position)
    end
  end
end
