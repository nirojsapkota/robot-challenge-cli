class Table
  def initialize(x_length, y_length)
    @x_length = x_length
    @y_length = y_length
  end

  def position_valid?(position)
    # === used as subset
    (0...@x_length).include?(position.x_pos) && (0...@y_length).include?(position.y_pos)
  end
end
