require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new }
  describe "#initialize" do
    it "has 5 cards" do
      expect(hand.grip.length).to eq(5)
    end

    it "contains only cards" do
      expect(hand.grip.all? {|x| x.is_a?(Card)}).to be true
    end
  end

  context "winning hands" do
    let(:king) {double("king", value: :K, suit: :S)}
    let(:queen) {double("queen", value: :Q, suit: :S)}
    let(:two) {double("two", value: 2, suit: :S)}
    let(:three) {double("three", value: 3, suit: :S)}
    let(:five) {double("five", value: 5, suit: :C)}


      # double("hand",
      #   grip: [king, queen, two, three, five],
      #   # grip: %i(king queen two three five),
      #   # high_card: :K

    describe "#high_card" do
      it "returns the highest card value" do
        deck = double("deck", stack: [king, queen, two, three, five])
        test_hand = Hand.new(deck)
        puts test_hand.grip
        expect(test_hand.high_card).to eq(:K)
      end
    end









  end




end
