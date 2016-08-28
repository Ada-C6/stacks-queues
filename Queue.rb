# waiting_list

class Queue
  attr_accessor :store 

  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    # @store << element
    # @store.unshift(element)
  end

  def dequeue
    return @store.shift
  end

  def front
    return @store[0]
    # return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    # return @store.empty?
    return size == 0
  end
end
