# ADT are the rules we follow when interacting with data.
# Stack is the way we interact with data
#  our class Stack adds contraints to the array 

# uses an array to create a virtual stack (your array methods have no power here)
class Stack
  attr_reader :store
  def initialize
    @store = Array.new # holds elements that are working
  end
  
  def push(element)
    # push stuff into array here
    @store.push(element) # goes to the end of the array 
  end
 
  def pop
    return @store.pop
    # don't forget Ruby's implicit return
  end

  def top
    # returns first element of an array
    return @store.last
  end
 
  def size
    return @store.length
  end

  def empty?
    # checks for an empty array, returns boolean
    return size == 0 # @store.empty?
  end
end