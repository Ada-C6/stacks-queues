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

class CrazyCompany
    attr_reader :on_hire_list, :waiting_list

    def initialize
        @available_positions = 6
        @candidates = ['Tom', 'Jerry', 'Lilo', 'Stitch', 'Simba', 'Beast', 'Scar', 'Timon', 'Pumbaa']

        @on_hire_list = Stack.new
        (0..5).each do |i|
            @on_hire_list.push(@candidates[i])
        end

        @waiting_list = Queue.new
        (6..(@candidates.length-1)).each do |i|
            @waiting_list.enqueue(@candidates[i])
        end

    end


    def hire #method for each candidate
        cand = @waiting_list.dequeue
        @on_hire_list.push(cand)
        puts "We just hired: #{cand}"
        return @on_hire_list
    end

    def fire
        cand = @on_hire_list.pop
        @waiting_list.enqueue(cand)
        puts "We just fired: #{cand}"
        return @waiting_list
    end

    def hiring_process
        @on_hire_list.print
        @waiting_list.print

        fired_num = rand(1..6)
        puts "Dice rolled: #{fired_num}"

        (1..fired_num).each do
            fire
        end
        @waiting_list.print

        (1..fired_num).each do
            hire
        end
        @on_hire_list.print

        return "End of process"
    end
end

company = CrazyCompany.new
r = company.hiring_process
puts r
