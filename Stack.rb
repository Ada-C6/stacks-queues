class Stack
  def initialize
    @drs_hired = Array.new
  end

  def push(element)
    @drs_hired.push(element) #@drs_hired << element
  end

  def pop
    return @drs_hired.pop
  end

  def top
    return @drs_hired.last
  end

  def size
    return @drs_hired.length
  end

  def empty?
    return @drs_hired.empty? # size == 0
    # @store.length == 0
  end
end
