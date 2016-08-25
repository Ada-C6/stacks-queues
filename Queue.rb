class Queue
  def initialize
      @store = Array.new
  end

  def enqueue(element)
      @store << element
      # option 2: return @store.unshift(element)
  end

  def dequeue
      return @store.shift
      # option 2: return @store.pop
  end

  def front
      return @store.first
      # option 2: return @store.last
  end

  def size
      return @store.length
  end

  def empty?
      return size == 0
  end
end

# option 2 is adding elements to the front of the array, and taking elements off of the array from the end. Basically this is simply the other order than the active code above.
