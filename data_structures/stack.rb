class Stack
  def initialize
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack.push(el)
    @stack.dup
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    @stack.deepdup
    # return a copy of the stack
  end

  def deepdup(array)
    array.reduce([]) { |accum, e| e.is_a?(Array) ? accum << deepdup(e) : accum << e}
  end
end
