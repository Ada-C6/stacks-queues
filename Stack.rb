class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)   #@store << element
  end

  def pop
    return @store.pop        #removes element at top and returns that element
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0    #@store.empty?    OR    #@store.length == 0
  end

end
