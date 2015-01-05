require './src/board'

#
# @example to begin game
#   game = Game.new(10, 20, 5)
#
class Game
  attr_accessor :board

  #
  # instantiate a new board with x, y, # of mines
  # @note x and y start at 1 here, not 0!
  #
  def initialize(x, y, num_of_mines)
    raise ArgumentError, 'too many mines' if num_of_mines > (x * y)
    @board = Board.new(x, y, num_of_mines)
  end

  #
  # Click a specific x, y coordinate.
  # `puts` game over and returns if bomb
  # `puts` already revealed and returns if already revealed
  # Prints board if tile is revealed
  #
  def click(x, y)
    clicked = @board.click(x, y) == 'bomb'
    game_over if clicked == 'bomb'
    revealed  if clicked == 'revealed'
    @board.print_board
  end

  #
  # Flag a specific tile as a possible mine
  #
  def flag(x, y)
    @board.flag(x, y)
  end

  private

  def game_over
    puts 'game over'
    return
  end

  def revealed
    puts 'already revealed'
    return
  end
end
