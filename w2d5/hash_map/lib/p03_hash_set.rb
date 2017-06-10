require 'byebug'
require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 32)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    value = key.hash
    if @count >= num_buckets
      resize!
    end
    unless self.include?(value)
      self[value] << key
      @count += 1
    end
  end

  def include?(key)
    value = key.hash
    self[value].include?(key)
  end

  def remove(key)
    value = key.hash
    if self.include?(key)
      self[value].delete(key)
      @count -= 1
    end

  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_store = Array.new(num_buckets*2) { Array.new }
      @store.each do |bucket|
        bucket.each do |entry|
          new_store[entry.hash % (num_buckets * 2)] << entry.hash
        end
      end
    @store = new_store
  end
end
