# Now let's write a Queue class. We will need the following instance methods:
# enqueue(el), dequeue, and show.
# Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize()
    @queue = []
  end

  def enqueue(entry)
    @queue.shift(entry)
  end

  def dequeue(entry)
    @queue.pop(entry)
  end

  def show
    @queue.deepdup
  end

  def deepdup(array)
    array.reduce([]) { |accum, e| e.is_a?(Array) ? accum << deepdup(e) : accum << e }
  end
end
