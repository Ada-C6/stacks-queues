class Queue
  def initialize
    @line = Array.new
  end

  def enqueue(element)
    @line.push(element)
    #@store.unshift(element)
  end

  def dequeue
    return @line.shift
    #return @store.pop
  end

  def front
    return @line.first
    #return @store.last
  end

  def size
    return @line.length
  end

  def empty?
    size == 0
  end
end
