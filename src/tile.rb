class Tile
  attr_accessor :x, :y, :mine, :revealed, :flagged

  #
  #
  #
  def initialize(x, y, mine = false)
    @x        = x
    @y        = y
    @mine     = mine
    @revealed = false
    @flagged  = false
  end

  #
  # reveals a tile
  #
  def click
    @revealed = true
  end
end
