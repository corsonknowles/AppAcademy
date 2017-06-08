require 'deck'
require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "makes a deck array with length 52" do
      expect(deck.stack.length).to eq(52)
    end

    it "only includes Cards in the deck" do
      expect(deck.stack.all? {|e| e.is_a?(Card)}).to be(true)
    end

    it "includes jack of diamonds" do
      deck.stack.map! {|x| [x.value, x.suit]}
      expect(deck.stack.include?([:J, :D])).to be(true)
    end
  end
end
