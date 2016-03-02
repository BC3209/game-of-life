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

    def evolve?
      # Rule: 1
      world.cells.each do |cell|
        if cell.alive && world.live_neighbor_count(cell).count < 2
          cell.die!
      end
    end
  end
end


# WORLD CLASS
class World
  attr_accessor :rows, :columns, :board, :cells

  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns
    @cells = []
    @board = Array.new(rows) do |rows|
      Array.new(columns) do |columns|
        cell = Cell.new(rows, columns)
        cells << cell
        cell
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
    live_cell = board[cell.y - 1][cell.x + 1]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the SouthEast
    live_cell = board[cell.y + 1][cell.x + 1]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the SouthWest
    live_cell = board[cell.y + 1][cell.x - 1]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the NorthWest
    live_cell = board[cell.y - 1][cell.x - 1]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the East
    live_cell = board[cell.y][cell.x + 1]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the South
    live_cell = board[cell.y + 1][cell.x]
    live_neighbors << live_cell if live_cell.alive?
    # Neighbors to the West
    live_cell = board[cell.y][cell.x - 1]
    live_neighbors << live_cell if live_cell.alive?

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
