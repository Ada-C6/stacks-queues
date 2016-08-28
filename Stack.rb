class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    return @store.pop
  end

  def top
    return @store.last #this just tells us the top (last) element
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 #returns a boolean #or : @store.empty?
  end
end
