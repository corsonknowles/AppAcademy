class LRUCache
  def initialize
    @size = size
    @cache = []
    # @hash = Hash.new
  end

  def count
    @cache.count
    # @hash.count
    # returns number of elements currently in cache
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end


    # @hash[el] = true
    # adds element to cache according to LRU principle
  end

  def show
    p @cache
    nil
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
