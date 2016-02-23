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

class World
  attr_accessor :rows, :columns

  def initialize(rows=0, columns=0)
    @rows = rows
    @columns = columns
  end
end
