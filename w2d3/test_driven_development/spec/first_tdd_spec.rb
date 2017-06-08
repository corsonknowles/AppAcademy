require 'rspec'
require 'first_tdd'



# Remove dups
#
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:
#
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.
#

describe "#my_uniq" do
  it "removes duplicate entries from the given array" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end
end

# Two sum
#
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.
#
# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":
#
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)

describe "#two_sum" do
  it "returns an array of arrays in sorted order \n
  showing indexes of elements that sum to zero" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end
end

# My Transpose
#
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:
#
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:
#
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:
#
# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
 # => [[0, 3, 6],
 #    [1, 4, 7],
 #    [2, 5, 8]]

describe "#my_transpose" do
  it "returns a nested array that changes the original \n
  arrays rows to columns, and columns to rows" do
  expect(my_transpose([
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ])).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
        ])
      end


end
