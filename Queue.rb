 # unshift = adding element => front of the array
class Queue
  def initialize
    @queue = Array.new
  end

  #add item (to the back)
  def enqueue(element)
    return @queue.push(element)
  end

  #delete item
  def dequeue
    return @queue.shift
  end

  def front
    return @queue.first
  end

  def size
    return @queue.length
  end

  def empty?
    return @queue.length == 0
  end
end
