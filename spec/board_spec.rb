describe Board do
  let(:board) { Board.new(5, 6, 3) }

  describe 'initialize' do
    context 'with valid arguments' do
      it 'assigns x, y, num_of_mines' do
        expect(board.x_size).to       eql(5)
        expect(board.y_size).to       eql(6)
        expect(board.num_of_mines).to eql(3)
      end

      it 'creates a multidimensional array holding tiles' do
        expect(board.tiles).to be_an(Array)
        expect(board.tiles.first).to be_an(Array)
        expect(board.tiles.first.first).to be_a(Tile)
      end
    end
  end

  describe 'print_board' do
    it 'prints an ASCII representation of the Board' do
      expect(board.print_board).to be_a(String)
      expect(board.print_board.length).to eql(36)
    end
  end
end
