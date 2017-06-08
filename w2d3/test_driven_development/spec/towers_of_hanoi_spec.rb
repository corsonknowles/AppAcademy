require 'towers_of_hanoi'
require 'rspec'


# Towers of Hanoi
#
# Write a Towers of Hanoi game.
#
# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!
#
# Note: don't worry about testing the UI. Testing console I/O is tricky (don't bother checking gets or puts). Focus on:
#
# #move
# #won?

describe Towers do
  subject(:tower) { Towers.new(3) }
  context "#initialize" do
    it "creates a set of three arrays" do
      expect(tower.stack.length).to eq(3)
    end

    it "places starting discs at first tower" do
      expect(tower.stack.first).to eq([1,2,3])
    end
  end

  # let(:input) { $stdin.some_method = "1, 1"}
  # context "#get_move" do
  #   it "gets move from user" do
  context "#move" do
    # before(:all) do
    #   tower = Towers.new(3)
    #   tower.move([0,2])
    # end
    it "removes the top disk from the starting tower" do
      tower.move([0, 2])
      expect(tower.stack.first).to eq([2, 3])
    end
    it "moves the chosen top disk to the selected tower" do
      tower.move([0, 2])
      expect(tower.stack.last).to eq([1])
    end
    it "raises an error if the starting stack is outside of the range of the towers" do
      expect { tower.move([5,1]) }.to raise_error("Starting stack out of bounds")

      # "Start disc should be a number between 0 and #{tower.stack.size - 1}")
    end

    it "raises an error if the ending stack is outside of the range of the towers" do
      expect { tower.move([0,99]) }.to raise_error("Ending stack out of bounds")

      # ("Destination stack should be a number between 0 and #{tower.stack.size - 1}")
    end

  end

  context "#won?" do
    it "returns true if player has won the game" do
      tower.stack = [[], [], [1, 2, 3]]
      expect(tower.won?).to be(true)
    end

    it "returns false if player has not won the game" do
      tower.stack = [[1], [2], [3]]
      expect(tower.won?).to be(false)
    end
  end


end
