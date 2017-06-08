require 'card'
require 'deck'

class Hand

  attr_reader :grip

  def initialize(deck = Deck.new)
    @deck = deck
    @grip = draw_five

  end

  FACE_VALUES = (2..10).to_a + %i(J Q K A)
  # suits = %i(C D H S)

  def high_card
    high_value = 0
    @grip.each do |card|
      new_value = FACE_VALUES.find_index(card.value)
      if new_value > high_value
        high_value = new_value
      end
    end
    FACE_VALUES[high_value]
  end

  def two_of_a_kind
  end

  def three_of_a_kind
  end

  def straight
  end

  def flush
  end

  def full_house
  end

  def four_of_a_kind
  end

  def straight_flush
  end

  private
  def draw_five
    # @deck.shuffle!
    result = []
    5.times do |i|
      result << @deck.stack.shift
    end
    result
    # @deck.stack[0..4]
    # @deck = deck.stack[5..-1]
  end

  def value_count(array)
    hash = Hash.new(0)
    array.each do |e|
      hash[e.value] += 1
    end
    hash
  end

  def suit_count(array)
    hash = Hash.new(0)
    array.each do |e|
      hash[e.suit] += 1
    end
    hash
  end



end
