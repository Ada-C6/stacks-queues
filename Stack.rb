class Stack
  def initialize
    @store = Array.new
    #use array as underlying structure for the stack
    #in this way, the stack is actually put into an array with rules placed on it conforming to the stack
  end

  def push(element)
    @store.push(element)
    #the element goes to the end of the array
  end

  def pop
    return @store.pop
    #automatically pops the last element off
  end 

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == [ ]
    #@store.length == 0
    #@store.empty?
  end
end
