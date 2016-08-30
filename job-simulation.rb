# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first five people on the waiting list will be hired
# in the order that they are on the waiting list.  The first five people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

##Queue first in first out
##Stack last in first out

require './Stack.rb'
require './Queue.rb'

class Company
  attr_accessor :employees, :waiting_list

  def initialize(people)

    @people = people
    @num_workers = 6
    @waiting_list = Queue.new
    people.each do |x|
      @waiting_list.enqueue(x)
    end
    @employees = Stack.new
    hire_first_employees
  end

  def three_months_pass
    @roll = roll_dice
    fire_employees(@roll)
    hire_new_employees(@roll)
  end

  private

  def hire_first_employees
    ##HELP
    @num_workers.times do |x|
      hire = @waiting_list.dequeue
      @employees.push(hire)
    end
  end

  def fire_employees(roll)
    roll.times do |x|
      @employees.pop
    end
  end

  def hire_new_employees(roll)
    roll.times do |x|
      hire = @waiting_list.dequeue
      @employees.push(hire)
    end
  end

  def roll_dice
    return rand(1..6)
  end

end

people = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

tst = Company.new(people)
puts tst.waiting_list.inspect
puts tst.employees.inspect
puts tst.three_months_pass
puts tst.employees.inspect
puts tst.waiting_list.inspect
