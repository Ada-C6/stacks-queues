class Stack
  def initialize
    @store = Array.new  #an array is an underlying structure for a stack
  end

  def push(element)
    @store.push(element)
    #@store << element - same thing
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
    return size == 0 # returns true/false, could also do @store.empty? OR @store.length == 0
  end
end
