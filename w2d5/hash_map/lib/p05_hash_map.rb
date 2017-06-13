require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    !self[key].nil?
  end

  def set(key, val)
    count += 1 if self[key].nil?
    self[key] = val
  end

  def get(key)
  end

  def delete(key)
    if self[key]
      count -= 1
      self[key] = nil
    end
  end

  def each
    @store.each do |e|
      k, v = e
      yield k v
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
