class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(element)
    return @queue.push(element) #@queue.unshift(element)
  end

  def dequeue
    return @queue.shift #@queue.delete_at(0) or @queue.pop
  end

  def front
    return @queue.first #@queue[0] or
  end

  def size
    return @queue.length
  end

  def empty?
    return size == 0
  end

  def print
    puts "People waiting:"
    puts @queue
  end
end
