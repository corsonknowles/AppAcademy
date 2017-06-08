require_relative "card.rb"
require "byebug"

class Board
  attr_reader :grid

  CARDS = %w(A K Q J)

  def initialize(grid = nil)
    @grid = grid ||= Array.new(4) { Array.new(4) }
  end

  def won?

  end

  def reveal(guessed_position)

  end

  def populate
    new_deck = deck
    grid_length = grid.length
    grid_width = grid.first.length
    value = 0
    grid_length.times do |i|
      grid_width.times do |j|
        self[[i, j]] = new_deck[value]
        value += 1
      end
    end

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def deck
    deck = []
    4.times do |i|
      4.times do
        deck << Card.new(CARDS[i])
      end
    end
    deck.shuffle
  end

  def render
    # debugger
    puts grid.map { |lines| lines.map(&:to_s).join }
  end

end
