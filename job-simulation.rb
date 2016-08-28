# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first six people on the waiting list will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

require './Stack.rb'
require './Queue.rb'

class JobSimulator
  attr_accessor :waitlist, :working, :num_peeps
  def initialize(num_workers = 6, num_waiters = 10)
    # Need to store the currently working employees in a first in, last out. (Stack)
    # Need to store the waitlist of people (Queue)
    # The number of people that can be working at any time is 6 max. Requirements doesn't specify how many people are on the waitlist, so we'll just assume 10.
    @waitlist = Queue.new
     #populate the waitlist:
     num_waiters.times do |i|
       @waitlist.enqueue("Person #{i}")
     end

    @working = Stack.new
    #populate the working group:
    num_workers.times do |i|
      @working.push(@waitlist.dequeue)
    end
  end

  def how_many_jobs
    # Need a random number generator between (1..6) that will determine who gets "fired."
    num_jobs = rand(1..6)
    return num_jobs
  end

  def cycle_staff
    # Need a method that fires people (takes in random number between 1..6), and removes that  number of people from the working list.
    @num_peeps = how_many_jobs #stores the people taken out of working this cycle.

    #this removes the people from working and adds them to the end of the waitlist
    num_peeps.times do
      person_just_fired = @working.pop #take the person out of working
      @waitlist.enqueue(person_just_fired) #add that person to the end of the waitlist
    end

    #this fills the vacant spots with people from the front of the waitlist
    num_peeps.times do |i|
      @working.push(@waitlist.dequeue)
    end

  end
end

demo = JobSimulator.new
puts demo.working.inspect
puts demo.waitlist.inspect

demo.cycle_staff
puts demo.num_peeps
puts demo.working.inspect
puts demo.waitlist.inspect
