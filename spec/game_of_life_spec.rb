require_relative './spec_helper'
require_relative '../lib/cell'

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
      # expect(Cell).to be(:alive)
      # subject.should respond_to(:alive)
    end

    it 'should be dead when it is created' do
      expect(subject.alive).to be_falsey
      # subject.alive.should be_false
      expect(subject.x).to be == 0
      expect(subject.y).to be == 0
    end
  end

  context 'World' do
    subject { World.new }

    it 'should create a new world' do
      expect(World).to be(World)
    end
    it 'should respond to the proper methods' do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:columns)
    end
  end
end
