def my_uniq(array)
  result = []
  array.each do |entry|
    result << entry unless result.include?(entry)
  end
  result
end

def two_sum(array)
  result = []
  (0...array.length).each do |index|
    (index + 1...array.length).each do |index2|
      result << [index, index2] if array[index] + array[index2] == 0
    end
  end
  result
end

def my_transpose(array)
  how_long = array.length
  how_wide = array.first.length
  flat_array = array.flatten
  chunk_array = []
  result = []
  count = 0
  starter = 0

  until result.length == how_long
    until chunk_array.length == how_wide
      while count * how_long < flat_array.length
        chunk_array += [flat_array[starter + count * how_wide]]
        count += 1
      end
      count = 0
      starter += 1

    end
    result << chunk_array
    chunk_array = []
  end
  result

end


# how_long = array.length
# how_wide = array.first.length
# result = Array.new(how_long) {Array.new(how_wide)}
# how_long.times do |i|
#   # how_wide.times do |j|
#     result[i, j] = array[j, i]
#   end
# end
