class Queue
  def initialize
    @store = array.new
  end

  def enqueue(element)
    @store << element
    # option 2: @store.unshift(element)
  end

  def dequeue
    return @store.shift
    # option 2 - return @store.pop by changing the way that stuff is added to the array -- ie by putting things in the front.
  end

  def front
    return @store[0]
    # opetion 2: @store.last
  end

  def size
    return @store.length
  end

  def empty?
    @store.length == 0
  end
end
