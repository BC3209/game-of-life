require_relative './spec_helper'
require_relative '../lib/game'

describe 'Game of life' do
  context 'Cell' do
    subject { Cell.new }

    it 'should create a new cell object' do
      expect(Cell).to be(Cell)
    end

    it 'should respond to the proper methods' do
      expect(subject).to respond_to(:alive)
      expect(subject).to respond_to(:x)
      expect(subject).to respond_to(:y)
      expect(subject).to respond_to(:alive?)
      expect(subject).to respond_to(:dead?)
    end

    it 'should be dead when it is created' do
      expect(subject.alive).to be_falsey
      expect(subject.x).to be == 0
      expect(subject.y).to be == 0
    end
  end

# Let is 'lazy evaluated' meaning it isn't run until the method that it defines
# is run for the first time
# http://betterspecs.org/#let
let!(:world) { World.new}
  context 'World' do
     subject { World.new }

    it 'should create a new world object' do
      expect(World).to be(World)
    end

    it 'should respond to the proper methods' do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:columns)
      expect(subject).to respond_to(:board)
      expect(subject).to respond_to(:live_neighbor_count)
    end

    it 'should create a new board on initialization' do
      expect(subject.board).is_a?(Array)
    end

    it 'should detect a neighbor to the North' do
      cell = subject.board[1][1]
      subject.board[cell.y - 1][cell.x].alive = true
      subject.live_neighbor_count(cell).count.should == 1
    end

    it 'should detect a neighbor to the NorthEast' do
      cell = subject.board[1][1]
      subject.board[cell.y - 1][cell.x + 1].alive = true
      subject.live_neighbor_count(cell).count.should == 1
    end
    #
    # it 'should detect a neighbor to the SouthEast' do
    #   cell = subject.board[1][1]
    #   subject.board[cell.y + 1][cell.x + 1].alive = true
    #   subject.live_neighbor_count(cell).count eq(1)
    # end
  end


  context 'Game' do
    subject { Game.new }

    it 'should create a new game object' do
      expect(subject.is_a?(Game))
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:world)
      expect(subject).to respond_to(:cells)
    end

    it 'should plant seeds' do
      game = Game.new(world, [[1, 2], [0, 2]])
      expect(world.board[1][2]).to be_alive
      expect(world.board[0][2]).to be_alive
    end
  end


# context 'Rules' do
#     let!(:game) { Game.new }
#
#     context 'Rule 1: Any cell with fewer than two live neighbors dies, as if caused by over population' do
#       it 'should kill a live cell with 1 live neighbor' do
#         # Both of these cells have fewer than two live neighbors
#         # Both of these should be dead in the next stage
#         game = Game.new(world, [[1, 0],[2, 0]])
#         game.evolve!
#         expect(world.board[1,0]).to be_dead
#         expect(world.board[2,0]).to be_dead
#       end
#     end
#   end
end
