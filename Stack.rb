class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)      # same as @store << element

  end

  def pop
    return @store.pop     # .pop works naturally as a stack pop (but not a a queue pop)
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end
end
