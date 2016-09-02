# CS-FUN with Crystal
# The goal is to be able to use this class in our programs.
# A Queue is First in, First out. The traffic line.
# The normal rules for arrays are not working
class Queue
  def initialize
    @line = []
  end

  def enqueue(element)
    @line.push(element)
    # option 2: @line.unshift(element)
  end

  def dequeue
    # Alternative? @line = @line[1...@line.length]
    return @line.shift
  end

  def front
    return @line.first
  end

  def size
    return @line.length
  end

  def empty?
    return size == 0
  end
end
