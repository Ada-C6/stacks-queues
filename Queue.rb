class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
    #option 2: @store,unshift(element)
  end

  def dequeue
    return @store.shift
    #option 2:return @store.pop, same as stack
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
