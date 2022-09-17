require_relative 'spec_helper'
describe Robot do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe "report" do
    it "outputs current position" do
      position = Position.new(1, 1, 'east')
      robot.current_position = position
      expect(robot.report).to eq("1, 1 EAST")
    end

    context "place" do
      let(:position) { Position.new(2, 2, 'north')}

      it "is valid" do
        Commands::Place.new(robot, table, position)
        expect(robot.valid_position?).to eq(true)
      end

      it "is invalid" do
        Commands::Place.new(robot, table, Position.new(6, 6, 'south'))
        expect(robot.valid_position?).to eq(false)
      end

    end

    context "command sequences" do
      let(:position) { Position.new(2, 2, 'north')}
      it "is valid" do
        Commands::Place.new(robot, table, position)
        Commands::Move.new(robot, table)
        expect(robot.report).to eq("2, 3 NORTH")
      end

      context "invalid" do
        %w(Move Left Right Report).each do |cmd|
          it " #{cmd} command is invalid" do
            expect { Object.const_get("Commands::#{cmd}").new(robot, table) }.to raise_error(InvalidCommandSequenceError)
          end
        end

      end
    end
  end
end
