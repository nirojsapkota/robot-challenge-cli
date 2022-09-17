require_relative 'spec_helper'
describe Table do
  let!(:table) { described_class.new(5, 5) }

  describe 'initialize' do
    it 'initializes successfully' do
      expect(table).to be_a(Table)
    end
  end

  describe 'valid_position?' do
    it 'returns true' do
      position = Position.new(2, 2, 'east')
      expect(table.position_valid?(position)).to eq(true)
    end

    it 'returns false' do
      position = Position.new(6, 2, 'east')
      expect(table.position_valid?(position)).to eq(false)
    end
  end
end
