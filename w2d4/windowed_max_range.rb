require_relative 'minmaxstackqueue'
require 'byebug'
# Queues
#
# In the naive solution, we consider each window as a slice of the input array. On the first iteration, we slice the array from index 0 to index w. On the second iteration, we slice from 1 to w + 1, and so forth. However, slicing an array is rather costly. Since the window only moves one index at a time, it would be nicer to represent it as a queue. Every time we move the window, we could enqueue the next element and dequeue the last element. However, that still leaves us with the problem of expensive max and min operations. To solve this, we'll write a hybrid data structure called a MinMaxStackQueue.
#
# Let's take a detour to write this data structure.
#
# Do not move on until you have completed the Stacks and Queues exercises!
#
# Writing the Optimized Solution
#
# Armed with a working MinMaxStackQueue, this problem should be much easier. You'll want to follow the same basic approach as above, but use your new data structure instead of array slices. As before, return the current_max_range at the end of the method. Make sure all the test cases pass, and that you both understand the time complexity of this solution. Then talk to your TA about it and have them review your code!

#
# def optimized_window_range(array, window_size)
#   stack = StackQueue.new
#   range = nil
#
#   i = 0
#   while stack.size < window_size
#     stack.enqueue(array[i])
#     i += 1
#   end
#
#   range = stack.max - stack.min
#
#   while i < array.length
#     stack.dequeue
#     stack.enqueue(array[i])
#     i += 1
#     test_range = stack.max - stack.min
#     if test_range > range
#       range = test_range
#     end
#
#   end
#   range
# end


# p optimized_window_range([1, 0, 2, 5, 4, 8], 2)# == 4 # 4, 8
# p optimized_window_range([1, 0, 2, 5, 4, 8], 3)# == 5 # 0, 2, 5
# p optimized_window_range([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
# p optimized_window_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


# def windowed_max_range(array, window_size)
#   current_max_range = nil
#   array.each_with_index do |e, i|
#     next if i + window_size >= array.length
#     window = array[(i + 1)..(i + window_size)] #ws+1?
#     high = window.max
#     # high ||= 0
#     low = window.min
#     # low ||= 0
#     local = high - low
#     # unless high.nil? or low.nil?
#     # local ||= 0
#     current_max_range = local if current_max_range.nil? || current_max_range < local
#   end
#   current_max_range
#
# end

def optimum2(array, window_size)
  current_max_range = nil
  stack = StackQueue.new

  array.each_with_index do |e, i|
    # debugger
    break if i + window_size >= array.length

    if stack.size >= window_size
      stack.dequeue
    end

    stack.enqueue(e)
    next if stack.size < window_size

    # next if window_size + i


    # window = #array[(i + 1)..(i + window_size)] #ws+1?

    high = stack.max
    # high ||= 0
    low = stack.min
    # low ||= 0
    local = high - low
    # unless high.nil? or low.nil?
    # local ||= 0
    current_max_range = local if current_max_range.nil? || local > current_max_range
  end
  current_max_range
end

p optimum2([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p optimum2([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p optimum2([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p optimum2([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

p optimum2([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimum2([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimum2([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimum2([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


#
# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. For each window:
# Find the max value in the window.
# Find the min value in the window.
# Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
# Return current_max_range.


#
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
