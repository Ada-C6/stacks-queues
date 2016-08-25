# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first five people on the waiting list will be hired
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
require './Die.rb'

# Create a new class to contain company behaviours
class BadBusiness
  attr_accessor :employees, :waitlist

  # Initilize class with current employees and waitlist
  def initialize
    @employees = Stack.new
    @waitlist = Queue.new
  end

  # Hire people
  def hire(employee)
    @employees.push(employee)
  end

  # Hire many employees
  def hire_many(array_of_employees)
    array_of_employees.each do |employee|
      @employees.push(employee)
    end
  end

  # Fire people
  def fire
    @just_fired = @employees.top
    @employees.pop
  end

  # Add people to the waitlist
  def add_to_waitlist(waitlister)
    @waitlist.enqueue(waitlister)
  end

  def add_many_to_waitlist(array_of_waitlisters)
    array_of_waitlisters.each do |waitlister|
      @waitlist.enqueue(waitlister)
    end
  end


  def fire_and_waitlist
    fire
    add_to_waitlist(@just_fired)
  end

  def hire_from_waitlist
    hire(@waitlist.front)
    @waitlist.dequeue
  end


  #Run three-month fire/hire operation
  def three_month_hire_fire
    count = Die.roll

    count.times do
      fire_and_waitlist
    end

    count.times do
      hire_from_waitlist
    end
  end

  # Loop three-month fire/hire operation
  def time_pass
    while true
      puts "Run three-month hire/fire cycle? Y / N"
      user_input = gets.chomp.downcase
      case user_input
      when "y", "yes"
        three_month_hire_fire
        puts "Current employees: #{employee_list}\nCurrent waitlist: #{waitlist_list}"
      when "n," "no"
        exit
      else
        puts "Please enter Y or N."
      end
    end
  end


  #Print out the array of employees (for testing)
  def employee_list
    @employees.store
  end

  #Print out the waitlist array (for testing)
  def waitlist_list
    @waitlist.store
  end


end

acme = BadBusiness.new
acme.hire_many(["employee1", "employee2", "employee3", "employee4", "employee5", "employee6"])
acme.add_many_to_waitlist(["waitlist1", "waitlist2", "waitlist3", "waitlist4", "waitlist5", "waitlist6", "waitlist7", "waitlist8", "waitlist9", "waitlist10"])

acme.time_pass
