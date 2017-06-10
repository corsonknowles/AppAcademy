require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    # (0..@max).cover?(num)
    num.between?(0, @max)
    # num > @max || num < 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :max
  def initialize(num_buckets = 32)
    @store = Array.new(num_buckets) { Array.new }
    @max = num_buckets
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % max]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 32)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @max = num_buckets
  end

  def insert(num)
    if @count >= @max
      resize!
    end
    unless self.include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @max]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @max *= 2
    new_store = Array.new(@max) { Array.new }
    @store.each do |bucket|
      bucket.each do |entry|
        new_store[entry % @max] << entry
      end
    end
    @store = new_store
  end
end
