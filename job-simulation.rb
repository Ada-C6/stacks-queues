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
require 'csv'
require_relative 'Stack'
require_relative 'Queue'
# require_relative 'names.csv'

class Company
  attr_accessor :waiting_list, :current_employees

  def initialize
    available_positions = 6
    @waiting_list = Queue.new
    @current_employees = Stack.new

    populate_waitlist
    #hire(available_positions)# hire 6 people from waiting list automatically

  end

  def populate_waitlist
    CSV.read("./names.csv").each do |n|
      name = n[0] # csv returns lines as an array and I want a string - one name per line, so string is at index 0
      @waiting_list.enqueue(name)
    end
    return @waiting_list #returns object: Queue
  end

  def passage_of_time# passing of time makes rolling, firing, and hiring happen
    #call roll
    #call fire
    #call hire
  end

  def roll #roll die to see how many will be fired
    die_roll = rand(1..6)
    return die_roll
  end

  def fire(amount) # rolled number of people will be fired from the stack and placed in the back/end of the queue
    #amount (rolled number).times remove employee from top of stack and place in queue
  end

  def hire(amount) # rolled number of people will be hired from the queue
    amount.times do # amount.times remove first employee from queue and place on top of stack
      @current_employees.push(@waiting_list.dequeue)
    end
  end
end
