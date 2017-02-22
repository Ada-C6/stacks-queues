class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    return @store.push(element)
    # if this is changed, option 2: return @store.unshift(element)
  end

  def dequeue
    return @store.shift # return @store.delete_at(0) does the same thing
    # if this is not changed, option 2: return @store.pop
  end

  def front
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0
  end

  def values
    return @store
  end

  # I created this method in Queue and Stack because it was less than ideal to output the array-formatted values into my Hr class' methods
  def values_to_s
    string_of_values = String.new
    @store.length.times do |i|
      string_of_values += "#{@store[i]}, "
    end
    return string_of_values.chop.chop
  end

end
