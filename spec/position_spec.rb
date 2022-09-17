require_relative 'spec_helper'
describe Position do

  describe 'initialize' do
    context 'valid arguments' do
      it 'properly' do
        position = Position.new(0, 0, 'east')
      expect(position.facing_direction).to eq(:east)
      end
    end

    context 'invalid arguments' do
      it 'raises exception for invalid direction' do
        expect{ Position.new(0, 0, 'eeast') }.to raise_error(InvalidCommandError)
      end
    end
  end


  describe 'turn direction' do
    it 'left returns next direction' do
      position = Position.new(0, 0, 'east')
      expect(position.turn_left).to eq(:north)
    end

    it 'right returns next direction' do
      position = Position.new(0, 0, 'east')
      expect(position.turn_right).to eq(:south)
    end
  end

  describe 'move' do
    Position::DIRECTIONS.each do |dir|
      it_behaves_like 'move successfully', dir
    end
  end
end


