class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)
    # or @store << element
  end

  def pop
    return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
    # or retrun @store.size
  end

  def empty?
    return @store.empty?
    #or return size == 0
  end
end
