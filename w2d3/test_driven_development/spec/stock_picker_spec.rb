require "stock_picker.rb"
require 'rspec'

# Stock Picker
#
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!
#
describe '#stockpicker' do
  let(:monthdata) do
    days = (1..30).to_a
    prices = Array.new(30) {rand(1000)}
    days.zip(prices)
  end

  let(:naive_test) do
    [[1, 5], [2, 100], [3, 50]]
  end

  let(:strong_test) do
    [[1,80],
      [2,100],
      [3,5],
      [4,50],
      [5,60],
      [6,75]]
  end

  it "outputs the most profiable pair of days on which to first \n
  buy the stock and then sell the stock" do
    expect(stockpicker(naive_test)).to eq([1, 2])
  end

  it "only returns sell days that are after buy days and it \n
   picks the two days with the biggest difference in prices" do
    expect(stockpicker(strong_test)).to eq([3, 6])
  end

end
