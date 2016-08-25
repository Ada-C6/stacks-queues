class Queue

  attr_reader :store

  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end

  def front
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
