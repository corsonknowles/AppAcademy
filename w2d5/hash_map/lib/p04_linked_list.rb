

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  # optional but useful, connects previous link to next link
  # and removes self from list.
  def remove
    #middle element
    if @prev && @next
      @prev.next = @next
      @next.prev = @prev
      @key, @prev, @next = nil, nil, nil
    #first element
    elsif @next
      @next.prev = nil
      @next = nil
    #last element
    elsif @prev
      @prev.next = nil
      @prev = nil
    end
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize
    @head = Link.new(:head, :head)
    @tail = Link.new(:tail, :tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil if empty?
    link = @head.next

    until link == @tail
      return link.val if link.key == key
      link = link.next
    end
    nil
  end

  def include?(key)
    return false if empty?
    link = @head.next
    until link.next == @tail
      return true if link.key == key
      link = link.next
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    if empty?
      @head.next = new_link
      @tail.prev = new_link
      #assign to head and tail sentinal nodes
      new_link.next, new_link.prev = @tail, @head
    else
      new_link.next = @tail
      last_node, @tail.prev = @tail.prev, new_link
      new_link.prev = last_node
      last_node.next = new_link
    end
  end

  def update(key_search, value)
    return nil if empty?
    link = @head.next

    #this should never be nil, why do we have to exclude link.nil?
    until link.nil? || link == @tail
      if link.key == key_search
        link.val = value
      end
      link = link.next
    end
    nil
  end

  def remove(key)
    return nil if empty?
    link = @head.next
    #this should never be nil, why do we have to exclude link.nil?
    until link.nil? || link.next == @tail
      if link.key == key
        link.remove
      end
      link = link.next
    end
  end

  def each(&prc)
    link = @head.next
    until link == @tail
      prc.call(link)  #(link.key, link.val)
      link = link.next
    end
    self
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

# a = Link.new("a", 2)
# a.next = Link.new("b", 2)
