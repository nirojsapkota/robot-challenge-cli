require_relative '../spec_helper'
describe Commands::Right do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe 'executing right command' do
    direction = Position::RIGHT_TRACKS
    direction.each do |dir, next_dir|
      it "returns #{next_dir}" do
        position = Position.new(1, 1, dir)
        Commands::Place.new(robot, table, position)
        Commands::Right.new(robot, table)
        expect(robot.current_position.facing_direction).to eq(next_dir.to_sym)
      end
    end
  end
end
