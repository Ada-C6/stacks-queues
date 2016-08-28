# [x] A company has a stack of max six programmers - empty array @store

# People change each interval.

# The company has a queue of programmers on a waiting list

# [x] When we initialize the program, the first six people on the queue will be dequeued and pushed onto the stack

# [x] At the end of an interval, a random number will be generated between 1 and 6

# [x]That many people will be popped off the stack and be enqueued back on the waiting list
# e.g 
# if the dice roll is X
#   pop X people off stack and enqueue them to the waiting list
#   [x] do this step with a loop?
#   [x] dequeue X people from waiting list and push to stack

# class Company
#   # queue in here somewhere
#   # stack in here somewhere
#   def time_passed
#   end
# end A company has a stack of max six programmers

# I had to look at Crystal's solution. I became to frustrated
# and head bangy. Once I seen her solution I realized my mental representation of the solution was way off. 
# I still have my notes on the problem above and additional work in my rocket boook if you want to review. 

require './Stack.rb'
require './Queue.rb'
# should have required Die.rb but...

## do not need arrays here as they are initialized in the stack and que classess
class Corpsecorps
  attr_reader :workers_stack, :waiting_queue

  def initialize (workers_count=6, waiters_count=10) # why do default args have to be kissing, it looks wrong. 
    #precondition for intialization
    if workers_count > waiters_count
      raise ArgumentError.new("Current workers must be less than or equal to the number of those waiting to work") 
    end
    #enqueue and assigns number to person
    @waiting_queue = Queue.new # utilizes parent class from require file
    waiters_count.times do |person|
      @waiting_queue.enqueue("Person#{person+1}") 
    end
    #deques persons off queue and pushes them onto workers stack
    @workers_stack = Stack.new # utlizes parent class from require file
    workers_count.times do
      new_worker = @waiting_queue.dequeue
      @workers_stack.push(new_worker)
    end
  end

  def time_passed
    #Adapted shamelessly and without regret form Chris' Die.rb
    die = rand(1..6)
    die.times do
      back_to_waiting = @workers_stack.pop
      puts "Back to the waiting line: #{back_to_waiting}\n\n"
      @waiting_queue.enqueue(back_to_waiting)

    end

    die.times do
      off_to_work = @waiting_queue.dequeue
      puts "Off to work with you: #{off_to_work}"
      @workers_stack.push(off_to_work)
    end
  end
end

#################################################################
## BEGIN TESTING
#################################################################

corpsecorps_dallas = Corpsecorps.new(6, 10)
puts "Corpsecorps is excited to be expanding our Dallas office!"
puts "Our current priveleged busy-bees are #{corpsecorps_dallas.workers_stack.store.to_s}."
puts "Our future worker drones in waiting are #{corpsecorps_dallas.waiting_queue.queue.to_s}"

puts "Has the new quarter arrived? Please enter 'y' for yes or 'n' for no."
new_quarter = gets.chomp.downcase[0]

while new_quarter == 'y' || new_quarter == 'nil'
  corpsecorps_dallas.time_passed
  puts "Recruiting..."
  puts "Corpsecorps is excited to welcome #{corpsecorps_dallas.workers_stack.store.to_s} to our happy Corpsecorps family."
  puts "While these unfortuante souls will be returning to our wait list." 
  puts "#{corpsecorps_dallas.waiting_queue.queue.to_s}. So sad for them."

  puts "Has the new_quarter arrived? Please enter 'y' or 'n'."
  new_quarter = gets.chomp.downcase[0]
end







