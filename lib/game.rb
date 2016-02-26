 # Game Class to interact with World and Cell Class
class Game
  attr_accessor :world, :cells

  def initialize(world=World.new, cells=[])
    @world = world
    @cells = cells

    cells.each do |cell|
      world.board[cell[0]][cell[1]].alive = true
    end
  end
end

# WORLD CLASS
class World
  attr_accessor :rows, :columns, :board

  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns

    @board = Array.new(rows) do |rows|
               Array.new(columns) do |columns|
                 Cell.new(rows, columns)
                 #   0,0   0,1    0,2
                 # [[Cell, Cell, Cell],
                 #   1,0   1,1    1,2
                 #  [Cell, Cell, Cell],
                 #   2,0   2,1    2,2
                 #  [Cell, Cell, Cell]]
      end
    end
  end


  def live_neighbor_count(cell)
    live_neighbors = []
    # Neighbors to the North
    if cell.y > 0
      live_cell = board[cell.y - 1][cell.x]
      live_neighbors << live_cell if live_cell.alive?
    end

    # Neighbors to the NorthEast
    # Neighbors to the SouthEast
    # Neighbors to the SouthWest
    # Neighbors to the NorthWest
    # Neighbors to the East
    # Neighbors to the South
    # Neighbors to the West
    live_neighbors
  end
end

# CELL CLASS
class Cell
  attr_accessor :alive, :x, :y

  def initialize(x=0, y=0)
    @alive = false
    @x = x
    @y = y
  end

  def alive?
    alive
  end

  def dead?
    !alive
  end
end
