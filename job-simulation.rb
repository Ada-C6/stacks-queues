# job_simulation

# Yael Fine


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


class Company
  attr_reader :time_interval, :employed_stack, :waiting_queue
  def initialize
    # create available positions counter
    @available_positions_counter = 6
    @time_interval = 0
    # create a new stack array for currently employed.
    @employed_stack = Stack.new
    # (1..10).each do |i|
    #   @employed_stack.push(i)
    # end
    # create a new queue array for the waiting list
    @waiting_queue = Queue.new #push from the end, take from the begining
    (1..10).each do |i|
      @waiting_queue.enqueue(i)
    end
  end

  def first_time_hiring
    i = 1
    @available_positions_counter.times do |i|
      @waiting_queue.dequeue
      @employed_stack.push(i)
    end
  end

  def roll_dice # (check if there is already an implemented method...)
    @available_positions_counter = rand(1..6) # roll dice
  end

  def fire_and_hire
    i = 1
    @available_positions_counter.times do |i|
      @employed_stack.pop
      @waiting_queue.dequeue
      @employed_stack.push(i)
      @waiting_queue.enqueue(i)
    end
    # return @employed_stack.size
    # return @waiting_queue.size
  end

  def time_pass
    @time_interval += 3
    roll_dice
    fire_and_hire
  end

end

puts "new compnay object:"
puts company1 = Company.new
puts "how many ppl are in employed_stack:"
puts company1.employed_stack.size
puts "how many ppl are on waiting_queue:"
puts company1.waiting_queue.size

puts
puts
puts "resualts after first_time_hiring:"
company1.first_time_hiring
puts
puts "how many ppl are in employed_stack:"
puts company1.employed_stack.size
puts "how many ppl are in waiting_queue:"
puts company1.waiting_queue.size

puts
puts
puts "resaults after time_pass:"
puts company1.time_pass

puts
puts
puts "how many ppl are in employed_stack:"
puts company1.employed_stack.size
puts "how many ppl are in waiting_queue:"
puts company1.waiting_queue.size
