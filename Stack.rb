#We are using an array to define what how a stack works

class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
    #@store.push(element)
  end

  def pop
    return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
    #size == 0
    #@store.empty?
  end

  def to_s
    return @store
  end
end
