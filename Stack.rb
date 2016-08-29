class Stack
  def initialize
    @store = Array.new #Using stracture of array, but we're limiting the methods/creating the rules for usage
  end

  def push(element)
    @store.push(element)
  end

  def pop
    return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty? #Or use return size == 0 (this is calling the previous method) #Or use return @store.length == 0
  end
end
