require_relative '../spec_helper'
describe Commands::Move do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe "executing move command" do

    context "facing west" do
      it "moves successfully" do
        position = Position.new(1, 1, 'west')
        Commands::Place.new(robot, table, position)
        Commands::Move.new(robot, table)
        expect(robot.report).to eq('0, 1 WEST')
      end
    end
    context "facing north" do
      it "moves successfully" do
        position = Position.new(1, 1, 'north')
        Commands::Place.new(robot, table, position)
        Commands::Move.new(robot, table)
        expect(robot.report).to eq('1, 2 NORTH')
      end
    end
    context "facing east" do
      it "moves successfully" do
        position = Position.new(1, 1, 'east')
        Commands::Place.new(robot, table, position)
        Commands::Move.new(robot, table)
        expect(robot.report).to eq('2, 1 EAST')
      end
    end
    context "facing south" do
      it "moves successfully" do
        position = Position.new(1, 1, 'south')
        Commands::Place.new(robot, table, position)
        Commands::Move.new(robot, table)
        expect(robot.report).to eq('1, 0 SOUTH')
      end
    end

  end
end
