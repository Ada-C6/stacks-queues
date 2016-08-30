class Queue
  def initialize(array)
    @queue = array
  end

  def enqueue(element)
    @queue << element
    # or @queue.push(element)
  end

  def dequeue
    return @queue.shift
  end

  def front
    return @queue.first
  end

  def size
    return @queue.length
  end

  def empty?
    return size == 0 # or @queue.empty?
  end
end
