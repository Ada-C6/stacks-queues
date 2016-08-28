class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    return @store.push(element) # array << element
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
    return size == 0 # @store.empty? or @store.length == 0
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
