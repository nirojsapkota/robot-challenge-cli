require_relative '../spec_helper'
describe Commands::Place do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe "executing place command" do
    it "places successfully" do
      position = Position.new(1, 1, 'west')
      Commands::Place.new(robot, table, position)
      expect(robot.current_position).to eq(position)
    end

    it "doesnt place in invalid location" do
      position = Position.new(5, 6, 'west')
      Commands::Place.new(robot, table, position)
      expect(robot.current_position).to eq(nil)
    end
  end
end
