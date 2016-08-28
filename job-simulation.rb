
require './Stack.rb'
require './Queue.rb'
require 'faker'
require 'awesome_print'


class CrappyCompany

attr_accessor :currently_working, :waiting_list, :roll, :showing, :number

# company starts with a waiting list, and then completes an initial hiring, taking the first 6 people from waitlist
  def initialize
    @waiting_list = ["Emma Woodhouse", "Emma Bovary", "Katniss Everdeen", "Lady Macbeth", "Anna Karenina", "Scout Finch", "Hester Prynne", "Luna Lovegood", "Liz Bennett", "Anne Elliot", "Hermione Granger", "Jane Eyre", "Arya Stark", "Jo March"]  # queue
    @people_currently_working = [] # stack
    initial_hiring
  end

# initial hiring method, only called within initialize
  def initial_hiring
    6.times do
      @people_currently_working << @waiting_list.shift
    end
    puts "Congratulations to those who were hired from our waiting list pool!  In three months, we will determine who gets to move into a job and who needs to (temporarily) leave! Here is the starting list of workers!"
    ap @people_currently_working
  end

# process for firing, treats people_currently_working as a stack (the last people hired are the first fired)
  def firing
    @number = time_passing # calls on time_passing method to roll die and determine number of people to fire
    @number.times do
      @waiting_list << @people_currently_working.pop
    end
    puts "Three months have passed.  A #{@number} was rolled. Here is our new waiting list."
    return @waiting_list
  end

# process for hiring, treats waiting_list as a queue (the first people on waitlist are the first to begin working)
  def hiring
    @number.times do # uses number from roll in firing method
      @people_currently_working << @waiting_list.shift
    end
    puts "Here is our new list of workers for the next three months."
    return @people_currently_working
  end

# artificially creates the idea of time passing - called each time the firing method is called
  def time_passing
    roll
  end

# called by time_passing method - randomly returns a number from 1-6
  def roll
    return @showing = Random.rand(6) + 1  #instead of 0-5 inclusive, it becomes 1-6
  end

# shows number on the die from roll (helpful in testing)
  def showing   #same as attr_reader -> just lets you see value
    return @showing
  end

end

company = CrappyCompany.new
ap company.firing
ap company.hiring
ap company.firing
ap company.hiring
