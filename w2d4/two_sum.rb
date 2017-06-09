#time: O(n^2)


def bad_two_sum(arr, target)
  arr.combination(2).any? {|pair| pair.reduce(:+) == target }

end

arr = [0, 1, 5, 7]
bad_two_sum(arr, 6) # => should be true
bad_two_sum(arr, 10) # => should be false

def sorted_two_sum(arr, target)
  sorted_arr = arr.sort
  arr.each_with_index do |value, index|
    new_target = target - value
    sorted_arr.delete_at(index)
    return true if binary_search(sorted_arr, new_target)
  end
  false
end
# i = 0
# j = 0
# while i < (array.length -1) && j < (array.length - 1)


array[2..5]

def binary_search(array, target)

  midpoint = array.length / 2
  pivot = array[midpoint]
  return false if array.empty?
  return true if pivot == target
  left, right = array[0...midpoint], array[midpoint+1..-1]
  if target < pivot
    binary_search(left, target)
  else
    binary_search(right, target)
  end
end

# left, right = array.partition(&pivot.method(:>))
# return false if left.empty? && right.empty?

arr = [0, 1, 5, 7]
p sorted_two_sum(arr, 6) # => should be true
p sorted_two_sum(arr, 10) # => should be false


# def bs_sums(arr, target)
#   too_long = arr.length - 1
#   midpoint = arr.length / 2
#
#   if arr[midpoint] == target
#     return true
#   elsif arr[midpoint] < target
#     bs_sums(arr[midpoint + 1..-1], target) unless midpoint + 1 == too_long
#   elsif arr[midpoint] > target
#     bs_sums(arr[0...midpoint], target)
#   end
#   false
# end
