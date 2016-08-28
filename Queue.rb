class Queue
  # attr_reader :store

  def initialize
    @store = Array.new
  end

  def enqueue(element)
    # put a new element at the END of the array
    return @store.push(element)
    # Option 2: return @store.unshift(element)
  end

  def dequeue
    # remove the first element of the array, and return the removed element
    return @store.shift
    # Option 2: return @store.pop
  end

  def front
    # tell me the first element of the array without mutating the original array
    return @store.first
    # Option 2: return @store.last
  end

  def size
    # Tell me the size of the Queue
    return @store.length
  end

  def empty?
    # Is the Queue empty?
    return @store.empty?  # OR: size == 0  =>this calls the size method above
  end
end
