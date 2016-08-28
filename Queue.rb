class Queue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    return @store.shift[0]
  end

  def front
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end
end
