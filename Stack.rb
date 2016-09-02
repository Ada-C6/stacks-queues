# CS-FUN with Crystal
# The goal is to be able to use this class in our programs.
# A stack is Last In, First Out. The book pile.
# The normal rules for arrays are not working
class Stack
  def initialize
    @store = Array.new
  end

  # The new element goes to the end of the list.
  def push(element)
    @store.push(element) # @store << element
  end

 # The array/stack after removing one item
 # Returns the popped item (so we can use it)
  def pop
    return @store.pop
  end

  # Shows what's next going to pop
  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 # 1) calling def-size ## 2) @store.length ==0 ## 3) @store.empty? - if we know Ruby well enough
  end
end
