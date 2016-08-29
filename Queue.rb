class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)   #@store << element
    # OPTION 2: if you want to add to the front of the array instead of the end, could use @store.unshift(element)
  end

  def dequeue
    return @store.shift
    # OPTION 2: return @store.pop
  end

  def front
    return @store.first
    # OPTION 2: @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0    # @store.lenth == 0    OR @store.empty?
  end
end
