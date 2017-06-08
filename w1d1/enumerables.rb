require 'byebug'
class Array
  def my_each(&proc)
    count = 0
    while count < self.length
      proc.call(self[count])
      count += 1
    end

    self
  end

  def my_select(&proc)
    result = []
    self.my_each do |num|
      result << num if proc.call(num)
    end
    result
  end

  def my_reject(&proc)
    result = []
    self.my_each do |num|
      result << num unless proc.call(num)
    end
    result
  end

  def my_any?(&proc)
    self.my_each do |element|
      return true if proc.call(element)
    end
    false
  end

  def my_all?(&proc)
    self.my_each do |element|
      return false unless proc.call(element)
    end
    true
  end

  def my_flatten
    result = []
    self.my_each do |element|
      # debugger
      if element.is_a? Array
        result += element.my_flatten
      else
        result << element
      end

    end
    result
  end

  def my_zip(*args)
    result = Array.new(self.length) { Array.new(0) } #{ Array.new(args.length + 1) }
    self.each.with_index do |element, index|
      result[index] << element
    end
    args.each do |argument|
      argument.each.with_index do |element, index|
        result[index] << element if index < self.length
      end
    end

    result
  end

  def my_rotate(center = 1)
    if center >= self.length
      angle = center % self.length
    elsif center < 0
      angle = self.length + center
    else
      angle = center
    end

    drop(angle) + take(angle)
  end

  def my_join(separator = "")
    result = ""
    self.my_each do |element|
      result << element + separator
    end
    delete = result.length - separator.length
    # puts result.length - remov
    result[0...delete]
  end

  def my_reverse
    result = []
    how_long = self.length - 1
    how_long.downto(0) do |index|
      result << self[index]
    end
    result
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new {|a, b| a <=> b }

    first = 0
    second = 0

    swaps = true

    while swaps
      first += 1

      swaps = false
      index = 0
      while index < self.length - 1
        second += 1

        result = prc.call(self[index], self[index + 1])
        # puts "Result of proc (#{self[index]}, #{self[index+1]}) is #{result}"
        # debugger
        if result > 0
          swaps = true
          # puts "swapping #{self[index]} and #{self[index+1]}"
          self[index], self[index + 1] = self[index + 1], self[index]
        end
        index += 1
      end
      # puts "swaps #{swaps}"
    end

    # puts "first #{first}"
    # puts "second #{second}"

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

end


def factors(number)
  if number < 0
    return [-1] + factors(number * -1)
  end
  return [0] if number == 0
  factors = [1]
  (2..(number/2)).to_a.each do |potential_factor|
    factors << potential_factor if number % potential_factor == 0
  end
  factors << number
end

# puts factors(9)
# answer9 = [1, 3, 9 ]
# puts factors(9) == answer9
#
# puts answer0 = factors(0)
# puts answer0 == [0]
#
# p answer_neg10 = factors(-10)
# puts answer_neg10 == [-1, 1, 2, 5, 10]

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  result = []
  str_length = string.length
  1.upto(str_length) do |length|
    index = 0
    while index < str_length
      sliced = string.slice(index, length)
      result << sliced if sliced.length == length
      index += 1
    end
  end
  result.uniq
end

def subwords(word, dictionary)
  substrings(word).my_select { |wordlet| dictionary.include?(wordlet)}

end


if __FILE__ == $PROGRAM_NAME
  p substrings("catt")
  p subwords("This long I wrote forthistesttoparseforus", ["this", "long", "nope"])
end
