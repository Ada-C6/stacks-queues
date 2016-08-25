class Stack
  def initialize
    @store = Array.new #underlying structure for the stack.
  end

  def push(element)
    @store.push(element) #@store << element
  end

  def pop
    return @store.pop #this will return and remove the last thing in the array.
  end

  def top
    return @store.last #since we're putting new things at the end,
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 #calling the method size that we've defined. 
  end
end
