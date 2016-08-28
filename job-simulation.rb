# Homework: Due by sunday
# ... she said something about doing a pull request

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
require 'ap'


# repeat every 3 months
def employee_turnover(months)
  # Initialize a waiting list as a queue
  waiting_list = Queue.new

  # Fill up the queue with 30 people
  30.times do |i|
    waiting_list.enqueue("person_#{i+1}")
  end

  # Initialize an employee list as a stack
  current_employees = Stack.new

  months.times do
    # Hire 6 people from the waiting list
    6.times do
      new_hire = waiting_list.dequeue
      current_employees.push(new_hire)
    end

    # Roll dice to determine # of people fired
    num_to_fire = rand(1..6)

    # fire those people last-hired first-fired
    num_to_fire.times do
      new_fire = current_employees.pop
      # put those fired at the end of the waiting list
      waiting_list.enqueue(new_fire)
    end
  end

  return [current_employees, waiting_list]
end



current_employees, waiting_list = employee_turnover(3)

puts current_employees.size
puts waiting_list.size


##### This is the code above with some printing to follow what I was doing (and reader methods in Stack and Queue)
# # repeat every 3 months
# def employee_turnover(cycles)
#   # Initialize a waiting list as a queue
#   waiting_list = Queue.new
#
#   # Fill up the queue with 30 people
#   30.times do |i|
#     waiting_list.enqueue("person_#{i+1}")
#   end
#
#   # Initialize an employee list as a stack
#   current_employees = Stack.new
#
#   cycles.times do
#     # Hire 6 people from the waiting list
#     puts "\n * 6 new employee(s) are Hired\n"
#     6.times do
#       new_hire = waiting_list.dequeue
#       current_employees.push(new_hire)
#     end
#     puts "    -there are now #{waiting_list.size} on the waiting list."
#     puts "    -and #{current_employees.size} employees at the company\n"
#
#     # Roll dice to determine # of people fired
#     num_to_fire = rand(1..6)
#
#     # fire those people last-hired first-fired
#     num_to_fire.times do
#       new_fire = current_employees.pop
#       # put those fired at the end of the waiting list
#       waiting_list.enqueue(new_fire)
#     end
#     puts "\n * #{num_to_fire} employee(s) are Fired"
#     puts "    -there are now #{waiting_list.size} on the waiting list."
#     puts "    -and #{current_employees.size} employees at the company\n\n"
#   end
#
#   return [current_employees, waiting_list]
# end
#
# current_employees, waiting_list = employee_turnover(3)
#
# print "Waiting List: "
# ap waiting_list.store
# print "Current Employees: "
# ap current_employees.store
