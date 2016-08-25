# let's make a stack
# array is underlying structure for a stack.
# write the rules for the stack, using an array.
# when we put things in a stack we are actually putting them in an array.
# but we get to constrain how we interact with the array.

class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element) # or @store << element
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
    return size == 0 # returns true if this is true and false if this is false (cool)
  end
end
