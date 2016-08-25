class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
      @store.push(element)
  end

  def pop
    # Test this
    # x = @store[@store.length - 1]
    # @store[@store.length - 1].delete
    # return x
    return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
    # return @store.empty
    # return @store.length == 0
  end
end
