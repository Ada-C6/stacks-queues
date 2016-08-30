
require './Stack.rb'
require './Queue.rb'

class Company
  attr_reader :waiters, :workers, :fired

  def initialize(num_waiters=6, num_workers=10) #set to 6 and 10 as default
    @waiters = Queue.new
    @workers = Stack.new
    @fired = fired

    num_waiters.times do |waiters|
      @waiters.enqueue("Waiting#{waiters + 1}")
    end

    num_workers.times do |workers|
      @workers.push("Worker#{ workers + 1 }")
    end

  end



  def fire
    #first, write a method to deterine how many will get fired, from 1-6(include)
    #take that number, and with that number.times remove from the hire list
    #then that number, add to the queue from the end
    @fired = rand(1..6)
    puts "Unfortunately, #{@fired} people will be fired today."
    @fired.times do
      gone = @workers.pop
    puts "Gone are #{gone}"
      @waiters.enqueue(gone)
    end

  end

  def hire #method to put people in the waiting list (queue) into jobs
    @fired.times do
      hired = @waiters.dequeue
      puts "Yay! #{hired} has been hired!"
      @workers.push(hired)
    end

  end

  # def hire_fire_period #combine hire and fire methods here for complete cycle?
  # end

end

###################### RUNNING PROGRAM

ada = Company.new

ada.fire
ada.hire
puts "after our fire/hire cycle, we have:"
puts "current workers: #{ada.workers.to_s}" #why does this return the object id?
puts "those on the waitlist: #{ada.waiters.to_s}" #why not returning these correctly?

#due sunday evening/tuesday
#git commit push
#when finished, use  new pull request from your name, type in your name
