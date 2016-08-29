class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    return @store.shift
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
  end
end
