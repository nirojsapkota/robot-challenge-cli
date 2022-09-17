require_relative '../spec_helper'
describe Commands::Report do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe "executing place command" do
    it "places successfully" do
      position = Position.new(1, 1, 'west')
      Commands::Place.new(robot, table, position)
      expect do
        Commands::Report.new(robot, table)
      end.to output("1, 1 WEST\n").to_stdout
    end

  end
end
