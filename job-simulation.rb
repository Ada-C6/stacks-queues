require './Stack.rb'
require './Queue.rb'

class Company
  attr_accessor :waitlist, :hired, :num

  #Initializes the two lists and a number for hiring/firing
  def initialize(people)
    @waitlist = Queue.new
    @hired = Stack.new
    @num = 6

    #Inputs the given array of people into the waitlist queue
    print "WAITLIST: "
    people.each do |person|
      @waitlist.enqueue(person)
      print "#{person} "
    end
    puts
  end

  #Instance method to hire a certain number of people from the waitlist
  def to_hired
    print "HIRED: "
    num.times do
      hiree = @waitlist.dequeue
      @hired.push(hiree)
      print "#{hiree} "
    end
    puts
  end

  #Instance method to fire a random number of people from the hired list
  def to_waitlist
    print "FIRED: "
    @num = rand(1..6)
    num.times do
      firee = @hired.pop
      @waitlist.enqueue(firee)
      print "#{firee} "
    end
    puts
  end

end

people = ["Bob", "Tom", "Betty", "Barb", "Elliot", "Sam", "Alex", "Greg", "Veronica", "Beth"]
testing = Company.new(people)
testing.to_hired
testing.to_waitlist
testing.to_hired
testing.to_waitlist
testing.to_hired
testing.to_waitlist
testing.to_hired
