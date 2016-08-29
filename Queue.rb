class Queue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element # @store.unshift(element)
  end

  def dequeue
    return @store.shift # @store.pop
  end

  def front
    return @store.first # @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end

  def print
    puts @store
  end
end
