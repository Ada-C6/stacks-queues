class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    # option 2: @store.unshift(element)
  end

  def dequeue
    return @store.shift
    # option 2: return @store.pop
  end

  def front
    return @store.first
    # option 2: @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end
end
