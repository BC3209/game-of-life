class Cell
  attr_accessor :alive, :x, :y

  def initialize(x, y)
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

class World
  attr_accessor :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end
end
