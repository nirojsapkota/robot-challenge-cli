RSpec.shared_examples 'move successfully' do |direction|
  let!(:position) { Position.new(1, 1, direction) }
  it "to #{direction} successfully" do
    expect(position.move.facing_direction).to eq(direction)
  end
end
