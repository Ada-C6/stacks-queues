# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first six people on the waiting list will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a die to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

require './Stack.rb'
require './Queue.rb'

class AwfulCompany

  attr_reader :current_employees, :waiting_list

  # Initialize company with compatible number of default parameters
  def initialize(num_employees = 6, num_waiting = 10)
    # Raise argument error if initialized with an incompatible number of people
    if num_employees < num_waiting
      puts "Number of workers must be greater or equal to number on the waiting list."
      raise ArgumentError
    end

    # Create the waiting list from num_waiting
    @waiting_list = Queue.new
    num_waiting.times do |i|
      @waiting_list.enqueue(i + 1)
    end

    # Create the employee list from num_employees
    @current_employees = Stack.new
    num_employees.times do
      @current_employees.push(num_employees)
    end
  end

  # As specified, the first six people on the waiting list are hired immediately
  def initial_hire
    6.times do
      puts "Initial hiring: #{ @waiting_list.front }"
      hired = @waiting_list.dequeue
      @current_employees.push(hired)
    end
    puts
  end

  def cycle
    # Roll the die
    number = rand(1..6)

    # Fire employees, last hired first fired, based on die roll
    number.times do
      puts "Fired: #{ @current_employees.top }"
      fired = @current_employees.pop
      @waiting_list.enqueue(fired)
    end
    puts

    # Hire employees, first in first out, based on die roll
    number.times do
      puts "Hired: #{ @waiting_list.front }"
      hired = @waiting_list.dequeue
      @current_employees.push(hired)
    end
    puts
  end
end

horrid_process = AwfulCompany.new(10, 12)
puts "Original setup:"
puts "Workers = #{horrid_process.current_employees.to_s}"
puts "Aspiring workers = #{horrid_process.waiting_list.to_s}"

horrid_process.initial_hire

horrid_process.cycle
