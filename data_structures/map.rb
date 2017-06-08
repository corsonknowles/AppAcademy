# Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a 2D
#array. Let's write a Map class (following a similar pattern to Stack and Queue)
# that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are
#always unique. When implemented with arrays, a map might look something like
#this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key, value),
# lookup(key), remove(key), show. Note that the assign method can be used to
#either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are @
#enforced.

class Map
  def initialize
    @secret_vault = []
  end

  def assign(key, value)
    @secret_vault += [key, value]
    @secret_vault.deepdup
  end

  def lookup(key)
    @secret_vault.each do |e|
      return e.last if e.first == key
    end
  end

  def show
    @secret_vault.deepdup
  end

  def remove(key)
    pair_to_delete = nil
    @secret_vault.each do |e|
      pair_to_delete = e if e.first == key
    end
    @secret_vault.delete(pair_to_delete)
  end

  def deepdup(array)
    array.reduce([]) { |accum, e| accum << (e.is_a?(Array) ? deepdup(e) : e) }
  end
end
