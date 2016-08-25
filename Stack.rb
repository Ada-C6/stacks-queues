####  Creating a stack for Ruby
# - Inside the stack it is just an array with rules

class Stack

  def initialize
    @store = Array.new
  end

  def push(element)
    # put a new element at the END of the array
    return @store.push(element) # Could also use @store << element
  end

  def pop
    # remove the last element of the array, and return the removed element
    return @store.pop
  end

  def top
    # tell me the last element of the array without mutating the original array
    return @store.last
  end

  def size
    # Tell me the size of the Stack
    return @store.length
  end

  def empty?
    # Is the stack empty?
    return @store.empty?  # OR: size == 0  =>this calls the size method above
  end
end
