# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals.

# The first six people on the waiting list will be hired in the order that they are on the waiting list.
# The first six people will keep these positions for three months.
# At the end of three months, the manager will roll a dice to determine the number of people who will lose their jobs.
# The company will use the policy of last-hired-first-fired.
# if the dice roll is 3, the last 3 people hired will lose their jobs to the first 3 people on the waiting list.
# People losing their jobs will be placed on the back of the waiting list in the order that they are fired.
# This process will continue for every three-month interval.
# due Sunday evening/Tuesday morning

require './Stack.rb'
require './Queue.rb'

class CrazyCompany
  def initialize
    @wait_list = Queue.new #FIFO/Quene
    @employees = Stack.new #LIFO/stack
    initial_employees = ["A", "B", "C", "D", "E", "F", "G", "H", "J"]
    initial_employees.each do |initial_employee|
      @wait_list.enqueue(initial_employee)
    end
  end

  def hire(number_to_hire) #from wait_list
    candidates_to_hire = []
    if @wait_list.size >= number_to_hire
      number_to_hire.times do |i|
        candidate_to_hire = @wait_list.dequeue
        @employees.push(candidate_to_hire)
        candidates_to_hire << candidate_to_hire
      end
    else
      puts "Sorry, there are not enough candidates on the waiting list."
    end
    puts "Hired: #{candidates_to_hire.join(", ")}"
  end

  def fire(number_to_fire) #from employees
    employees_to_fire = []
    number_to_fire.times do |i|
      employee_to_fire = @employees.pop
      @wait_list.enqueue(employee_to_fire)
      employees_to_fire << employee_to_fire
    end
      puts "Fired: #{employees_to_fire.join(", ")}"
  end

  def three_month_interval
    #assume use a six sides die
    number_to_fire = rand(1..6)
    number_to_hire = number_to_fire
    fire(number_to_fire)
    hire(number_to_hire)
  end

  def status
    puts "current employees: #{@employees.to_s}"
    puts "current wait list: #{@wait_list.to_s}"
    puts "============================="
  end

  def call_interval(number_of_times)
    number_of_times.times do |i|
      puts "====interval:#{i + 1}======="
      three_month_interval
      status
    end
  end

end
#============TEST================
new_company = CrazyCompany.new
new_company.status
new_company.hire(6)
new_company.status
new_company.call_interval(2)
