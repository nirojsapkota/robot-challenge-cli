RSpec.shared_examples 'turn direction successfully' do |dir, next_dir|
  it "returns #{next_dir}" do
    position = Position.new(1, 1, dir.to_s)
    Commands::Place.new(robot, table, position)
    Commands::Left.new(robot, table)
    expect(robot.current_position.facing_direction).to eq(next_dir.to_sym)
  end
end
