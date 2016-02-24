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
  attr_accessor :rows, :columns, :board

  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns

    @board = Array.new(rows) do |rows|
               Array.new(columns) do |columns|
                 Cell.new(rows, columns)
      end
    end
  end
end
