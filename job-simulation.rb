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

class TerribleCompany
  attr_reader :waiting_list, :current_employees

  def initialize(employees, applicants)
    number_of_employees = 6
    number_of_applicants = 6

    if number_of_employees > number_of_applicants
      raise ArgumentError
    end

    @applicants = Queue.new
    number_of_applicants.times do |n|
      @applicants.enqueue(i+1)
    end

    @employees = Stack.new
    number_of_employees.times do
      @employees.push(@applicants.dequeue)
    end

  end

  def employment_cycle

    (rand(6) + 1).times do
      fire = @employees.pop
      puts "The following employees have been cut from the team: #{ fire }."
      @applicants.enqueue(fire)
    end

    (rand(6) + 1).times do
      hire = @applicants.dequeue
      puts "The following applicants have been selected for employment: #{ hire }.
      All current employees have job security...for the next 3 months"
      @employees.push(hire)
    end

  end

end
