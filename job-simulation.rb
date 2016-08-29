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


###################################################
###  Due Sunday Evening :: NINA MUTTY - PARENS  ###
###################################################

#####  Git Commit, Push, and Pull Request - on github(to Ada C6) (type in name) #####

require './Stack.rb'
require './Queue.rb'
require 'awesome_print'

class CrazyCompany
    attr_reader :waiting_list, :employees
    attr_accessor :switch_number

    def initialize(number_of_hires)
        @waiting_list = Queue.new       ## Create a waiting list (Queue - FIFO)
        @employees = Stack.new          ## Creates an employeed list (Stack - LIFO)
            (number_of_hires).times do |employee_number|  ## Push number of people to end of employed list to initialize company with number of employees
                @employees.push(employee_number + 1)
            end
        puts "You've initialized"
    end

    def create_waitlist(number)
        (number).times do |wait_number|   ### Push number of people to end of waiting list
            @waiting_list.enqueue(wait_number + 1)
        end
    end

    def add_to_wait(employee)
        @waiting_list.enqueue(employee)   ### Adds one person to waitlist at a time (at end)
    end

    # The employeed people at the waitlisted people will interact based on the random switch number chosen
    def switch_hires
        switch_number = rand(0..6)
        puts "#{switch_number} employees will be switched"
        switch_number.times do            ### Loop takes number of employees from the employee stack and adds them to the waitlist queue
            fired = @employees.pop
            @waiting_list.enqueue(fired)
        end
        switch_number.times do            ### Loop takes the same number of people off the waitlist and puts them in to the employeed list
            hired = @waiting_list.dequeue
            @employees.push(hired)
        end
    end
end



### Tests on tests on tests
company = CrazyCompany.new(6)
company.create_waitlist(10)
puts
ap company.waiting_list
ap company.employees
puts
company.switch_hires
ap company.waiting_list
ap company.employees

company.add_to_wait(11)
ap company.waiting_list
