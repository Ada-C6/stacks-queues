# A company has six hiring positions with more people wanting jobs than the number of available positions.  The company managers decide in order to give more people an opportunity to make money; they will allow people to work in three-month intervals.
require_relative 'Stack.rb'
require_relative 'Queue.rb'
require 'awesome_print'

class Die
  attr_reader :showing
  def initialize
      roll
  end
  def roll
    return @showing = Random.rand(6) + 1
  end
end

class CrappyCompanyEmployees
  # attr_accessor :current_employees, :waiting_list # Do I even need this?
  def initialize(array_of_employees,wait_list_array)
    @company = []
    @company << array_of_employees #@company[0] is always array of employees
    @company << wait_list_array #@company[1] is always array of wait list
    # ap @company
  end

  # hired people are queue style
  def hire(new_employees) #new_employees is a number
    push_in = Queue.new(@company[1])
    new_employees.times do
      @company[0] << push_in.front #Add new employees to @company[0]
      push_in.dequeue
    end
    # ap @company
    return @company
  end

  # fired people will be stack style
  def fire(ppl_to_fire)
    pull_out = Stack.new(@company[0])
    ppl_to_fire.times do
      @company[1] << pull_out.top #put employees back in wait list
      pull_out.pop # pop that employee out of the employee array
    end
    # ap @company
    return @company
  end


end


employees = []
wait = ["Crystal","Cynthia","Alexandra","Jeremy","Kari","Korica","Charles","Sarah","Chris","Jaime","Dan","Marleigh",]
company_employees = CrappyCompanyEmployees.new(employees,wait)
# The first six people on the waiting list will be hired in the order that they are on the waiting list.
puts "Hire 6 first employees"
employees = company_employees.hire(6)
puts "now employees: #{employees[0]}"
puts "now wait list: #{employees[1]}"

# At the end of three months, the manager will roll a dice to determine the number of people who will lose their jobs.
roll = Die.new
puts "Dice: #{roll.showing}"
puts "so #{roll.showing} people have to lose their jobs...it's a tough world :("
# People losing their jobs will be placed on the back of the waiting list in the order that they are fired.
company_employees.fire(roll.showing)
company_employees.hire(roll.showing)
puts "now employees: #{employees[0]}"
puts "now wait list: #{employees[1]}"
# ap company_employees

# Three more months pass....
roll = Die.new
puts "Dice: #{roll.showing}"
puts "so #{roll.showing} people have to lose their jobs...it's a tough world :("
company_employees.fire(roll.showing)
company_employees.hire(roll.showing)
puts "now employees: #{employees[0]}"
puts "now wait list: #{employees[1]}"

# Three more months pass...how is this company not being sued yet?
roll = Die.new
puts "Dice: #{roll.showing}"
puts "so #{roll.showing} people have to lose their jobs...it's a tough world :("
company_employees.fire(roll.showing)
company_employees.hire(roll.showing)
puts "now employees: #{employees[0]}"
puts "now wait list: #{employees[1]}"

# sigh...it continues...
roll = Die.new
puts "Dice: #{roll.showing}"
puts "so #{roll.showing} people have to lose their jobs...it's a tough world :("
company_employees.fire(roll.showing)
company_employees.hire(roll.showing)
puts "now employees: #{employees[0]}"
puts "now wait list: #{employees[1]}"
