# game.rb
Object used by the player to interact with the `Game` instance. Contains instance methods to start the game, and uncover or flag a tile.

Instantiates a board of `x * y` size, with `n` number of mines.

```ruby
# to begin game
game = Game.new(10, 20, 5)

# Game.rb constructor
def initialize(x, y, num_of_mines)
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

# Game.rb `flag` instance method
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
```

# board.rb
Contains attributes:
* `x_size`
* `y_size`
* `num_of_mines`
* `tiles`
  * `tiles` property holds all `Tile` instances in a multidimensional `Array`.

```ruby
# Board.rb constructor
def initialize(x_size, y_size, num_of_mines)
  @x_size       = x_size
  @y_size       = y_size
  @num_of_mines = num_of_mines
  @tiles        = Array.new(y_size) { Array.new(x_size, Tile.new) }
  set_mines
end

# prints an ASCII representation of the board
def print_board
  @x_size.times.each do |x|
    @y_size.times.each do |y|
      puts '| |' unless @tiles[x][y].revealed?
      puts '|f|' if     @tiles[x][y].flagged?

    end
  end
end

#
# @return [Boolean] returns false if tile is a bomb or already revealed
#
def click(x, y)
  return 'bomb'     if @tiles[x][y].bomb?
  return 'revealed' if @tiles[x][y].revealed?
  @tiles[x][y].click
end

private

def set_mines
  reset_all_mines
  num_of_mines.times.each do |i|
    x = rand(@x_size)
    y = rand(@y_size)
    @tiles[x][y].mine = true
  end
end

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
```

# tile.rb
Parent class for `Mine`. Has method `click`, which reveals the tile.

Has attributes:
* `num_of_surrounding_mines`
* `mine`
* `revealed`
* `flagged`

```ruby
# Tile.rb constructor
def initialize(mine = false)
  @mine = mine
end

# reveals a tile
def click
  @revealed = true
end
```
