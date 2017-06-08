require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "MerryDeath") }
  subject(:dessert) { Dessert.new("pudding", 5, "Kyoko") }
  # subject(:fake_dessert) { Dessert.new("iced-cream", :five, "Chef") }
  # let(:adding) { (dessertish.add_ingredient("roe")) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("pudding")
      # expect(dessert.type).to_not be(undefined)
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("iced-cream", "five", "Soux Chef")}.to raise_error(ArgumentError)
    end

  end

  subject(:dessertish) { Dessert.new("salmon mousse", 15, chef) }

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessertish.add_ingredient("roe")
      expect(dessertish.ingredients).to eq(["roe"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessertish.add_ingredient("chocolate")
      expect(dessertish.ingredients).to receive(:shuffle!)
      dessertish.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessertish.eat(3)
      expect(dessertish.quantity).to eq(15 - 3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessertish.eat(16) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef MerryDeath the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessertish)
      dessertish.make_more
    end
  end
end
