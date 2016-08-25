class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop #take out last element in and return it
    return @store.pop
  end

  def top #return the last thing in, which is at the top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty? #return size is calling the method above, def size
    return size == 0 #@store.empty?, @store.length == 0
  end
end

#the rules of how you interact with array have been changed. the usual Array
#methods will no longer work
