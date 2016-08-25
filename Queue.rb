class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    return @store.push(element)
    #@store.unshift(element)
  end

  def dequeue
    return @store.delete_at(0) #@store.shift
    #@store.pop
  end

  def front
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end
end
