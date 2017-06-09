
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(entry)
    @store.unshift(entry)
  end

  def dequeue(entry)
    @store.pop(entry)
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
  end

  def push(entry)
    @store.push(entry)
  end

  def pop
    @store.pop
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end


class MinMaxStack

  attr_reader :hash
  def initialize
    @store = []
    @hash = Hash.new(nil)
    @maxstack = nil
    @minstack = nil
  end

  # def self.maxfactory
  #   MyStack.new
  # end

  # def self.minfactory
  #   MyStack.new
  # end

  def push(entry)
    set_max(entry)
    set_min(entry)

    @store.push(entry)
  end

  def set_max(entry)
    if @maxstack.nil?
      @maxstack = MyStack.new
    end

    if @hash[:max].nil? || @hash[:max] < entry
      @hash[:max] = entry
      @maxstack.push(entry)
    end
  end

  def set_min(entry)
    if @minstack.nil?
      @minstack = MyStack.new
    end

    if @hash[:min].nil? || @hash[:min] > entry
      @hash[:min] = entry
      @minstack.push(entry)
    end
  end

  def maximum
    @hash[:max]
  end

  def minimum
    @hash[:min]
  end

  def unset_min
    return nil if @minstack.nil?
    @minstack.pop
    @hash[:min] = @minstack.peek
  end

  def unset_max
    return nil if @maxstack.nil?
    @maxstack.pop
    @hash[:max] = @maxstack.peek
  end

  def pop

    if peek == @hash[:max]
      unset_max
    end

    if peek == @hash[:min]
      unset_min
    end

    @store.pop
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @left = MinMaxStack.new
    @right = MinMaxStack.new

  end

  def enqueue(entry)
    @left.push(entry)
  end

  def dequeue
    if @right.empty?
      # @left, @right = @right, @left
      # @left = MyStack.new
      slinky_queue
    end
    @right.pop
  end

  def size
    @left.size + @right.size
  end

  def empty?
    @left.empty? && @right.empty?
  end

  def max
    return @right.maximum if @left.maximum.nil?
    return @left.maximum if @right.maximum.nil?
    [@left.maximum, @right.maximum].max
  end

  def min
    return @right.minimum if @left.minimum.nil?
    return @left.minimum if @right.minimum.nil?
    [@left.minimum,@right.minimum].min
  end

  private
    def slinky_queue
      @right.push(@left.pop) until @left.empty?
    end
end
