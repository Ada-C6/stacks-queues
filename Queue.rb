class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end

  def front
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end
