require 'byebug'

def naive_stockpicker(array)
  #passes our tests!
  hash = array.to_h
  sorted_by_value = hash.sort_by do |k, v|
    v
  end

  buy_day = sorted_by_value.first.first
  sell_day = sorted_by_value.last.first
  [buy_day, sell_day]

end


def stockpicker(array)
  # debugger
  difference_set = []
  (0...array.length).each do |index|
    (index + 1...array.length).each do |index2|
      difference_set << [array[index2].last - array[index].last, index + 1, index2 + 1]
    end
  end
  difference_set.sort.last[1..-1]
end
