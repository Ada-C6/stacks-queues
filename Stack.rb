#LIFO

class Stack
  def initialize
    @store = Array.new
  end

  def push(element) # Putting it into the array
    @store.push(element) # or @store << element
  end

  def pop
    return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 # "size" calls size method, can also do
    # @store.empty? OR
    # @store.length == 0
  end
end
