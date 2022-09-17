require_relative '../spec_helper'
describe Commands::Left do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe "executing left command" do
    Position::LEFT_TRACKS.each do |dir, next_dir|
      it_behaves_like "turn direction successfully", dir, next_dir
    end
  end
end
