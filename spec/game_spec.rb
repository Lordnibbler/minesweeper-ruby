describe Game do
  let(:game) { Game.new(5, 6, 3) }

  describe 'initialize' do
    context 'without arguments' do
      it 'raises an error' do
        expect {
          Game.new
        }.to raise_error(ArgumentError, 'wrong number of arguments (0 for 3)')
      end
    end

    context 'with too many mines' do
      it 'raises an error' do
        expect {
          Game.new(1, 1, 100)
        }.to raise_error(ArgumentError, 'too many mines')
      end
    end

    context 'with valid arguments' do
      it 'instantiates a new Board' do
        expect(game.board).to be_a(Board)
      end
    end
  end

  describe 'click' do

  end
end
