require 'card'
require 'rspec'

describe Card do
 describe "#initialize" do
   subject(:card) { Card.new(:J, :D) }
   it "sets a value" do
     expect(card.value).to eq(:J)
   end
   it "sets a suit" do
     expect(card.suit).to eq(:D)
  end
 end
end
