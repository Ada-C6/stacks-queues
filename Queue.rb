class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    return @store.shift #removes the first thing off the array
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 
  end
end
