class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    # option 2: @store.unshift(element) push from the first, not the last
  end

  def dequeue
    @store.shift # remove and return the first item in the array
    # option2: return @store.drop # remove the first item in the array and return the rest
    # return @store.delete_at(0)
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

  def to_s
    return @store.join(", ")
  end

end
