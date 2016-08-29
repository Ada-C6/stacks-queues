class Queue
  def initialize
      @store = Array.new
  end

  def enstore(element)
      @store.push(element)
      #option 2: @store.unshift(element)
  end

  def dequeue
      return @store.shift   ## Pushes out first element of array
      # option 2: @store.pop
  end

  def front
      return @store.first  ## Returns first element of array (still in array)
      #option 2: @store.last
  end

  def size
      return @store.length
  end

  def empty?
      return size == 0
  end
end
