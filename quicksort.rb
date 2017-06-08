class Array

  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    prc = Proc.new &pivot.method(:>)
    left, right = partition(&prc)

    return *left.quicksort, pivot, *right.quicksort
  end

end


class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))

    return *left.quicksort, pivot, *right.quicksort
  end
end

def quicksort(array)
  return [] if array.empty?

  copy = array.dup
  pivot = copy.delete_at(rand(array.size))

  left, right = copy.partition(&pivot.method(:>))

  return quicksort(left).flatten + [pivot] + quicksort(right).flatten
end
