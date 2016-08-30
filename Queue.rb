class Queue

  attr_reader :store
  def initialize
    @store = Array.new
  end

  def enqueue(element) #also .push
    @store.push(element)
  end

  def dequeue #remove the first thing added
    @store.shift
  end

  def front #
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end
end
