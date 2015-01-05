describe Board do
  let(:board) { Board.new(5, 6, num_of_mines) }
  let(:num_of_mines) { 3 }

  describe 'initialize' do
    context 'with valid arguments' do
      it 'assigns x, y, num_of_mines' do
        expect(board.x_size).to       eql(5)
        expect(board.y_size).to       eql(6)
        expect(board.num_of_mines).to eql(num_of_mines)
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

  describe 'click' do
    context 'on a mine' do
      it 'returns mine' do
        expect(
          board.click(board.mines.first.x, board.mines.first.y)
        ).to eql('mine')
      end
    end

    context 'on a revealed tile' do
      before do
        board.tiles.first.first.revealed = true

        # ensure we dont click on a mine
        board.tiles.first.first.mine = false
      end

      it 'returns revealed' do
        expect(board.click(0, 0)).to eql('revealed')
      end
    end

    context 'on a non-revealed tile' do
      before do
        board.tiles.first.first.revealed = false

        # ensure we dont click on a mine
        board.tiles.first.first.mine = false
      end

      it 'sets revealed == true' do
        board.click(0, 0)
        expect(board.tiles[0][0].revealed).to eql(true)
      end
    end
  end

  describe 'build_tiles' do
    before do
      board.tiles = nil
      expect(board.tiles).to be_nil
    end

    it 'builds a tiles instance variable' do
      board.send(:build_tiles)
      expect(board.tiles).to be_an(Array)
      expect(board.tiles.first).to be_an(Array)
      expect(board.tiles.first.first).to be_a(Tile)
    end
  end

  describe 'randomize_mines' do
    it 'sets @num_of_miles tiles to be mines' do
      board.send(:reset_all_mines)
      board.send(:randomize_mines)
      expect(board.mines.count).to eql(num_of_mines)
      board.mines.each do |tile|
        expect(tile.mine).to eql(true)
      end
    end
  end

  describe 'reset_all_mines' do
    it 'empties the @mines array and sets mine == false on all tiles' do
      expect(board.mines.count).to be > 0
      board.send(:reset_all_mines)
      expect(board.mines.count).to eql(0)

      board.tiles.each do |tiles|
        tiles.each do |t|
          expect(t.mine).to eql(false)
        end
      end
    end
  end
end
