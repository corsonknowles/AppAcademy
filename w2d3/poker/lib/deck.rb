require 'card'

class Deck

  attr_reader :stack

  def initialize
    @stack = card_maker
  end

  def card_maker
    face_cards = %i(J Q K A)
    number_cards = (2..10).to_a
    cards = face_cards + number_cards
    suits = %i(C D H S)
    deck = []
    suits.each do |suit|
      cards.each do |value|
        deck << Card.new(value, suit)
      end
    end
    deck
  end

end
