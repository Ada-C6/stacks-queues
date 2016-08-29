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

require_relative 'Stack.rb'
require_relative 'Queue.rb'

class CrazyCompany
  attr_reader :waiting_list, :c_workers
  def initialize
    @work_interval = 3
    @num_of_employees = 6
    @all_interested_employees = ["person1","person2","person3","person4","person5","person6","person7","person8","person9","person10"]

    @waiting_list = create_waitlist

    @c_workers = first_group_of_workers
  end

  def create_waitlist
    @waiting_list = Queue.new
    @all_interested_employees.length.times do |i|
      @waiting_list.enqueue(@all_interested_employees[i])
    end
    return @waiting_list
  end

  def first_group_of_workers
    @c_workers = Stack.new
    @num_of_employees.times do |i|
      @c_workers.push(@all_interested_employees[i])
      @waiting_list.dequeue
    end
    return @c_workers
  end

  def employee_rotate
    @num_of_people_to_be_fired = rand(1..6)
    puts "The number of employees to be rotated is #{ @num_of_people_to_be_fired }."
    fire_employees (@num_of_people_to_be_fired)
    hire_from_waitlist(@num_of_people_to_be_fired)
  end

  def fire_employees (number)
    number.times do |i|
      w = @c_workers.pop
      @waiting_list.enqueue(w)
    end
    return c_workers
  end

  def hire_from_waitlist (number)
    number.times do |i|
      w = @waiting_list.dequeue
      @c_workers.push(w)
    end
    return c_workers
  end

end
