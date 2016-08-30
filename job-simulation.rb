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

class Simulation
    attr_reader :people_waiting, :people_working

#initializes # of workers "waiting" as a queue and pushes the first six into the "working" stack
    def initialize(num_waiting)
        if num_waiting < 6
            raise ArgumentError.new("There are more than 6 people waiting for this job, please try again.")
        end
        @people_waiting = Queue.new
        (1..num_waiting).each do |label|
            @people_waiting.enqueue("person ##{ label }")
        end
        num_working = 6
        @people_working = Stack.new
        num_working.times do
            @people_working.push(@people_waiting.dequeue)
        end
    end

#this cycle theoretically occurs every three months... # people fired based on the roll of a dice (last hired, first fired)...
     def fire_hire_cycle
         dice = rand(1..6)
         puts "#{ dice } number of people will be fired at this three month interval, due to the dice roll..."
         dice.times do
             person_fired = @people_working.pop
             puts "person ##{ person_fired } is fired"
             person_hired = @people_waiting.dequeue
             puts "person ##{ person_hired } is hired"
             @people_waiting.enqueue(person_fired)
             @people_working.push(person_hired)
         end
         puts "These six people are working for the next three months..."
         puts @people_working.to_s
         puts "And these people are on the waiting list, in this order, beginning with those who will be the first hired..."
         puts @people_waiting.to_s
     end
end

test_trial = Simulation.new(26)
puts test_trial.people_working.to_s
puts test_trial.people_waiting.to_s

puts "after first 3 month interval..."
puts test_trial.fire_hire_cycle

puts "after another 3 month interval..."
puts test_trial.fire_hire_cycle

puts "and after a third 3 month interval..."
puts test_trial.fire_hire_cycle


# store waiting list
# store people currently working
#
# pick stack or queue

# DUE SUNDAY evening (complete pull request by Sunday)--or due by Tuesday AM

# commit and push
# then add pull request to Crystal with my name in the comments
