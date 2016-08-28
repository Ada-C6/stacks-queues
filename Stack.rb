# In IRB: require "./Stack.rb"
# <object>.inspect --> shows the variables inside an object

class Stack
  def initialize
    @store = Array.new    # The data is still stored in an underlying array, but we only allow operations appropriate to a stack
  end

  def push(element)
    @store << element   # Add a new element to the end; or use .push
  end

  def pop
    return @store.delete_at(-1)   # Take out the last element and return that element; or use .pop
  end

  def top
    return @store.last    # Return the last element in the array
  end

  def size
    return @store.length
  end

  def empty?
    return @store.length == 0   # Or size == 0; or use .empty. Checks if it is empty
  end

  def to_s

    string = ""

    @store.each do |element|
      string =  element.to_s + "\n" + string
    end

    return "TOP\n" + string + "BOTTOM"
  end

end
