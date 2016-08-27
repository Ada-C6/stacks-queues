#FIFO

class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    # OR option 2: @store.unshift(element) - puts element at front
  end

  def dequeue
    return @store.shift
    # OR option 2: return @store.pop
  end

  def front
    return @store.first
    # OR option 2: return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end
end
