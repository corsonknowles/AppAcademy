require 'byebug'

##my_min complexity
# space: O(1)
# time: O(n**2)
def my_min(array)
  minimum_element = array.first
  array.each_with_index do |e, i|
    array.each_with_index do |f, j|
      next if i >= j

      if e <= f && e < minimum_element
        minimum_element = e
      elsif f < e && f < minimum_element
        minimum_element = f
      end
    end
  end
  minimum_element
end

# complexity
#space: O(1)
#time: O(n^2)
def my_min2(array)
  least = true
  array.each_with_index do |e, i|
    array.each_with_index do |f, j|
      next if i == j
      least = false if f < e
    end
    return e if least
    least = true
  end
end

#space: O(1)
#time: O(n)

def my_min3(array)
  minimum_element = array.first
  array.each do |e|
    minimum_element = e if e < minimum_element
  end
  minimum_element
end

# p list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min2 list
# p my_min3 list


# complexity
# space: O(n**2)
#time: O(n**3)
def largest_contiguous_subsum(array)
  subsets = subsets(array)
  subset_sums = subsets.map {|subset| subset.reduce(:+) }
  subset_sums.compact.max
end

def subsets(array)
  subsets = []
  array.each_with_index do |e, i|
    array.each_with_index do |f, j|
      subsets << array[i..j]
    end
  end
  subsets
end

# def better_subsum(array)
#   # total = array.reduce(&:+)
#   value = array.first
#   test_array = []
#   array.each_with_index do |e, i|
#     test_array << e
#     value = test_array.reduce(&:+) if test_array.reduce(&:+) > value
#   end
#   test_array = []
#   take2 = array.reverse
#   take2.each_with_index do |e, i|
#     test_array << e
#     value = test_array.reduce(&:+) if test_array.reduce(&:+) > value
#   end
#
#   value

  # look ahead 2 or n elements

  # array.each_with_index do |e, i|
  #
  #
  # end
  #
  # array.each_with_index do |e, i|
  #
  # end

# end


# hash = Hash.new(0) #{ |hash, key| hash[key] = 0 }
#
# def better_subsum4(array)
#   biggest_sum = array.first
#   running_sum = array.first
#   start_idx = 0
#   end_idx = array.length - 1
#   i = start_idx
#   j = end_idx
#   while i < end_idx
#     hash[i] = hash[i-1] + array[i]
#     start_idx = i if array[i..end_idx].reduce(:+) > array[start_idx..end_idx].reduce(:+) #[step to end] []
#     i += 1
#   end
#
#   while j >= start_idx
#     end_idx = j if array[start_idx..j].reduce(:+) > array[start_idx..end_idx].reduce(:+)
#     j -= 1
#   end
#
#   array[start_idx..end_idx].reduce(:+)
# end

# complexity
# time: O(n**2)
# space O(n**2)  == > O(n) depending on timeliness of garbage collection
def better_subsum2(array)
  start_idx = 0
  end_idx = array.length - 1
  i = start_idx
  j = end_idx
  while i < end_idx
    start_idx = i if array[i..end_idx].reduce(:+) > array[start_idx..end_idx].reduce(:+)
    i += 1
  end
  while j >= start_idx
    end_idx = j if array[start_idx..j].reduce(:+) > array[start_idx..end_idx].reduce(:+)
    j -= 1
  end
  array[start_idx..end_idx].reduce(:+)
end

p list = [2, 3, -6, 7, -6, 7]
p better_subsum2(list) # => 8 (from [7, -6, 7])

p list = [-5, -1, -3]
p better_subsum2(list) # => -1 (from [-1])

p list = [5, 3, -7]
p better_subsum2(list) # => 8


#Third time is the charm.
# space: O(1)
# time: O(n)

def better_subsum3(array)
  return array.max if array.all? { |e| e < 0 }  # def less_than_zero?  Proc.new &0.:<.method end
  biggest_sum = array.first
  running_sum = biggest_sum

  array.each_with_index do |e, i|
    next if i == 0
    running_sum += e
    if running_sum < 0
      running_sum = 0
      next
    elsif running_sum > biggest_sum
      biggest_sum = running_sum
    end
  end
  biggest_sum
end

# p list = [2, 3, -6, 7, -6, 7]
# p better_subsum(list) # => 8 (from [7, -6, 7])
#
# p list = [-5, -1, -3]
# p better_subsum(list) # => -1 (from [-1])
#
# p list = [5, 3, -7]
# p better_subsum(list) # => 8

#
# arr1 = [-2, 3]
#
# arr2 = [5, -3, 2, -1 ]
p list = [2, 3, -6, 7, -6, 7]
p better_subsum3(list) # => 8 (from [7, -6, 7])

p list = [-5, -1, -3]
p better_subsum3(list) # => -1 (from [-1])

p list = [5, 3, -7]
p better_subsum3(list) # => 8


def largest_contiguous_subsum1(arr)
  max_sum = arr[0]
  acc_sum = max_sum
  arr.each do |num|
    acc_sum < 0 ? acc_sum = num : acc_sum += num
    max_sum = acc_sum if acc_sum > max_sum
  end
  max_sum
end

def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end

arr = []
100000000.times do
  arr << rand(-10..10)
end

p Benchmark.realtime {largest_contiguous_subsum1(arr)}
p Benchmark.realtime {largest_contiguous_subsum2(arr)}
p Benchmark.realtime {better_subsum3(arr)}
better_subsum3
