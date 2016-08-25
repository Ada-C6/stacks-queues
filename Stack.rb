class Stack
  def initialize
    @store = Array.new # gonna store whatever is in the stack
  end

  def push(element) # Actuall putting thing into an Array
    @store.push(element) #<< can also be user @store << element
  end

  def pop
    return @store.pop # pop method
  end

  def top
    return @store.last #This shows what is at the top of the stack, the last element
  end

  def size
    @store.length
  end

  def empty?
    return size == 0 # @store.empty? @store.length == 0 #size is referring to the method
  end
end
