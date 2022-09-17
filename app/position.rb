class Position

  attr_accessor :x_pos, :y_pos, :facing_direction

  DIRECTIONS = %i(east west north south)

  LEFT_TRACKS  = { north: :west, west: :south, south: :east, east: :north }.freeze
  RIGHT_TRACKS = LEFT_TRACKS.invert.freeze

  def initialize(x_pos, y_pos, facing_direction)
    @x_pos = x_pos
    @y_pos = y_pos

    raise InvalidCommandError.new "Invalid direction #{facing_direction}" unless DIRECTIONS.include?(facing_direction.to_sym)

    @facing_direction = facing_direction.to_sym
  end

  # returns next driving direction
  def turn_left
    LEFT_TRACKS[facing_direction]
  end

  def turn_right
    RIGHT_TRACKS[facing_direction]
  end

  def move
    x, y = next_position(facing_direction)
    Position.new(x, y, facing_direction)
  end

  private

  def next_position(current_direction)
    case current_direction.to_sym
    when :north
      [x_pos, y_pos + 1]
    when :east
      [x_pos + 1, y_pos]
    when :south
      [x_pos, y_pos - 1]
    else
      # west
      [x_pos - 1, y_pos]
    end
  end

end
