class Robot

  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  def report
    std_output(current_position) if valid_position?
  end

  def valid_position?
    placed?
  end

  private

  def placed?
    !!@current_position
  end

  def std_output(position)
    "#{position.x_pos}, #{position.y_pos} #{position.facing_direction.upcase}"
  end

end
