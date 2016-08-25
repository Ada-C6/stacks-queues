class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    # Test this:
    # x = @store[0]
    # @store[0].delete
    # return x
    return @store.shift
  end

  def front
    # return @store[0]
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
  end
end
