class Queue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue #remove element from the front
    return @store.shift
    #or leave pop the same as stack, and put stuff into the front above
    #@store.unshift(elemen)
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 #size called from above
  end
end
