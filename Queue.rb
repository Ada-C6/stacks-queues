class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    #or @store.unshift(element)
  end

  def dequeues
    return @store.shift
    #or @store.pop
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
