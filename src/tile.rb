class Tile
  attr_accessor :mine, :revealed, :flagged

  #
  #
  #
  def initialize(mine = false)
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
