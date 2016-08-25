class Stack

  attr_reader :store

  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element # or @store.push(element)
  end

  def pop
    @store.pop
  end

  def top
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
