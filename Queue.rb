class Queue
  def initialize
    @line = Array.new
  end

  def enqueue(element)
    @line.push(element)
    # or @store.unshift(element)
  end

  def dequeue
    return @line.shift
    # or @store.pop
  end

  def front
    return @line.first
    # or @line.last
  end

  def size
    return @line.length
  end

  def empty?
    return @line.empty?
  end
end
