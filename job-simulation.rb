require './Stack.rb'
require './Queue.rb'

class Company
  attr_accessor :waitlist, :hired, :num

  #Initializes the two lists and a number for hiring/firing
  def initialize(people)
    if people.length < 6
      raise ArgumentError.new("Error. You need to start with at least six employees.")
    end

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

  #Instance method to call the to_hired & to_fired methods every three months
  def time_passed
    to_hired
    print "Three months passed...\n"
    to_waitlist
  end

end

people = ["Bob", "Tom", "Betty", "Barb", "Elliot", "Amanda", "Jared", "Bryan", "Amy"]
testing = Company.new(people)
testing.time_passed
testing.time_passed
