class Queue
  def initialize
    @drs_list = Array.new
  end

  def enqueue(element)
    @drs_list.push(element)
    #@store.unshift(element)
  end

  def dequeue
    return @drs_list.shift
    #return @store.pop
  end

  def front
    return @drs_list.first
    #return @store.last
  end

  def size
    return @drs_list.length
  end

  def empty?
    size == 0
  end
end
