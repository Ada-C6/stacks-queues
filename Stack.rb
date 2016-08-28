class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element) # @store << element, element goes to the end of array.
  end

  def pop # take out and return the last element of the array
    return @store.pop # @store.delete_at(-1)
  end

  def top # return the last element of the array
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 # call size method
    # store.empty?
    # @store.length == 0
  end

  def to_s
    return @store.join(", ")
  end

end
