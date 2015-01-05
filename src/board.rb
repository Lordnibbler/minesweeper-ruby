require './src/tile'

#
# represents the Board of the minesweeper game
#
class Board
  attr_accessor :x_size, :y_size, :num_of_mines, :tiles

  #
  # instantiates a new board, with x, y tiles and randomized mines
  #
  def initialize(x_size, y_size, num_of_mines)
    @x_size       = x_size
    @y_size       = y_size
    @num_of_mines = num_of_mines
    build_tiles
    randomize_mines
  end

  #
  # @return [String] an ASCII representation of the board
  #
  def print_board
    board = ''
    @y_size.times do |y|
      @x_size.times do |x|
        if @tiles[y][x].mine
          board << 'B'
        elsif @tiles[y][x].revealed == false
          board << '?'
        elsif @tiles[y][x].flagged
          board << 'f'
        else
          board << 'r'
        end
      end
      board << "\n"
    end
    board
  end

  #
  # @return [Boolean] returns false if tile is a bomb or already revealed
  #
  def click(x, y)
    return 'bomb'     if @tiles[y][x].bomb
    return 'revealed' if @tiles[y][x].revealed
    @tiles[y][x].click
  end

  private

  #
  # builds a multidimensional array of tiles of x, y size
  #
  def build_tiles
    @tiles = Array.new(@y_size) { Array.new(@x_size) { Tile.new } }
  end

  #
  # randomly sets tiles to be mines
  #
  def randomize_mines
    reset_all_mines
    counter = 0
    while counter < @num_of_mines do
      x = rand(@x_size)
      y = rand(@y_size)
      if @tiles[y][x].mine == false
        @tiles[y][x].mine = true
        counter += 1
      end
    end
  end

  #
  # sets all tiles to not be mines
  #
  def reset_all_mines
    @tiles.each do |tiles|
      tiles.each do |t|
        t.mine = false if t.mine == true
      end
    end
  end

  # algorithm to set `num_of_surrounding_mines`
  def calculate_surrounding_mines(tile)
    # @todo how to calculate surrounding mines
  end
end
