class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element) # element going to end of the list
    # @store << element
  end

  def pop() # this takes one thing out
  return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 # or  @store.empty? # @store == 0
    #size here is calling the method size.  .empthy is a method.
  end
end
