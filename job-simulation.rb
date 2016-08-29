# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first (five) six people on the waiting list will be hired
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

class Employee
  attr_reader :id

  @@counter = 0
  def initialize
    @@counter += 1
    @id = @@counter
  end
end

############ MAIN PROGRAM ############
  INITIAL_WAITING_LIST = 20
  INITIAL_HIRED = 6
  NUM_OF_THREE_MONTH_CYCLES = 3

  def fire_and_hire(num_people, waitinglist, hiredlist)
    num_people.times do
      waitinglist.enqueue(hiredlist.pop)
      hiredlist.push(waitinglist.dequeue)
    end
  end

  waitinglist_queue = Queue.new
  hired_stack = Stack.new

  INITIAL_WAITING_LIST.times do
    emp = Employee.new
    waitinglist_queue.enqueue(emp)
    # print "Enqueueing "
    # puts emp.id
  end

  INITIAL_HIRED.times do
    emp = waitinglist_queue.dequeue
    hired_stack.push(emp)
    # print "Pushing "
    # puts emp.id
  end

  NUM_OF_THREE_MONTH_CYCLES.times do
    jobs_lost = Random.rand(6)+1
    fire_and_hire(jobs_lost, waitinglist_queue, hired_stack)
  end


########## MAIN PROGRAM ENDS ###########
