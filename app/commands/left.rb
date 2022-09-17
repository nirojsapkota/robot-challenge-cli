module Commands
  class Left < Command
    def run
      super
      @robot.current_position = Position.new(@robot.current_position.x_pos,
                                             @robot.current_position.y_pos,
                                             @robot.current_position.turn_left)
    end
  end
end
