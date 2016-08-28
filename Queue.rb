class Queue
  attr_reader :queue
  def initialize
    @queue = Array.new # class variable, why not array? #needs to be an array, changed
  end
  
  def enqueue(element)
    return @queue.push(element)
  end
 
  def dequeue
   return  @queue.shift
  end

  def front
    return @queue.first

  end
 
  def size
    return @queue.length
  end

  def empty?
    return size == 0
  end
end
