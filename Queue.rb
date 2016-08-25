class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element) #Or @store.unshift(element)
  end

  def dequeue
    return @store.shift #Or @store.pop
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end
end
