class Stack #we're going to write the rules of a stack by using an storing a data in an array but only allowign the rules of a stack to interact with the array. This class makes us interact with an array with the rules of a stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element) # also @store << element
  end

  def pop #take out the last element and return it
    return @store.pop
  end

  def top #get the last thing put into the arrary
    return @store.last
  end

  def size
    return @store.length
  end

  def empty? #checking if it is empty
    return size == 0
    #@store.empty?
    #@store.length == 0
    #CUrrently, calling the size method we wrote above
  end
end
# s = Stack.new
#Now, the array is a stack, and you cannot use methods like .length or .first because we're acting like a stack
