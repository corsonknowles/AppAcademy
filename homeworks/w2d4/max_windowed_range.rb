

def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_with_index do |e, i|
    next if i + window_size >= array.length
    window = array[(i+1)..(i + window_size)]      #ws+1?
    high = (window.max)
    # high ||= 0
    low = (window.min)
    # low ||= 0
    local = high - low
    # unless high.nil? or low.nil?
    # local ||= 0
    current_max_range = local if current_max_range.nil? || current_max_range < local
  end
  current_max_range

end
#
# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. For each window:
# Find the max value in the window.
# Find the min value in the window.
# Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
# Return current_max_range.



p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
