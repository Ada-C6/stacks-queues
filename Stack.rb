## An ADT is the conceptual rules that we follow to interact with the data
## The way we store the data - we use an array as an underlying array as a way of storing the data
    ## Because we're making the stack class, we can have rules for how we can interact with that array
    ## Now nobody can interact with this data in any way other than we've defined

class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
      @store.push(element) ## OR @store << element   --- when we push or shovel
  end

  def pop
      return @store.pop  ## There's a method that pop's it out - method only takes one thing out
  end

  def top
      return @store.last
  end

  def size
      return @store.length
  end

  def empty?
      return size == 0  ##Size is calling above method - will return a true or false
      ## @store.empty?
      ## @store.length == 0
  end
end
