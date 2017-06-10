require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |e, i|
      result += ((e.hash ^ i.hash)) #* prime(i))
    end
    result
  end

  # def prime?(num)
  #   (2..Math.sqrt(num)).each do |n|
  #     return false if num % n == 0
  #   end
  #   true
  # end
  #
  # def prime(n)
  #   result = [2, 3, 5, 7, 11]
  #   tester = 13
  #   until result.length >= n
  #     result << tester if prime?(tester)
  #     tester += 1
  #   end
  #   result[n]
  # end
end

class String
  def hash
    split("").map(&:ord).hash
    # chars.hash
    # result = 0
    # chars.each_with_index do |e, i|
    #   result += e.ord.hash ^ i.hash
    # end
    # result

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    check = self.to_a.sort
    check.each_with_index do |e, i|
      result += (e.first.to_s.ord.hash ^ e.last.ord.hash) ^ i.hash
    end
    result
  end
end
