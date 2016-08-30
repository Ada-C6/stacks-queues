# A company has six hiring positions with more people wanting jobs than the
# number of available positions.
#The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals.
#The first five people on the waiting list will be hired
# in the order that they are on the waiting list.  waiting list ==queue
#The first six people will
# keep these positions for three months.
#At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs.
#The company will use the policy of last-hired-first-fired.
#For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. === fired is a stack
#People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. === re-enter queue from the back of the line
#This process will continue for every three-month interval.



require './Stack.rb'
require './Queue.rb'

class Company
  attr_accessor :waiters, :workers

  def initialize(num_waiters, num_workers)
    @waiters = Queue.new
    @workers = Stack.new

    num_waiters.times do |waiters|
      @waiters.enqueue("Waiting#{waiters + 1}")
    end

    num_workers.times do |workers|
      @workers.push("Worker#{ workers + 1 }")
    end

  end

  def hire #method to put people in the waiting list (queue) into jobs
    5.times do
      hired = @waiters.dequeue
      puts "Yay! #{hired} has been hired!"
      @workers.push(hired)
    end

  end

  def fire
    #first, write a method to deterine how many will get fired, from 1-6(include)
    #take that number, and with that number.times remove from the hire list
    #then that number, add to the queue from the end
    fired = rand(1..6)
    puts fired
    fired.times do
      gone = @workers.pop
    puts "Gone are #{gone}"
      @waiters.enqueue(gone)
    end


  end

end

#create class
  #waiting list : stack or queue?
  #currently working :stack or queue?
#end class

#due sunday evening/tuesday
#git commit push
#when finished, use  new pull request from your name, type in your name
