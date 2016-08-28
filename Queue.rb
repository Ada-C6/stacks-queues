class Queue

  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    return @store.delete_at(0)  # Or use .shift method. There is also a .unshift method that appends to the beginning
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
  end

  def to_s
    return "FRONT...#{@store}...BACK"
  end

end

# Testing

# q = Queue.new
#
# q.enqueue(10)
# q.enqueue(5)
# q.enqueue(2)
# puts q.inspect
# puts "Just dequeued: " + q.dequeue.to_s
# puts q.inspect
# q.enqueue(1)
# puts q.inspect
# q.dequeue
# puts q.inspect
# puts q.size
# puts q.empty?
# q.dequeue
# q.dequeue
# puts q.empty?
