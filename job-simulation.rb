##due Sunday 28th // commit, push, press new pull request on ada-C6
# A company has six hiring positions.
#work in three-month intervals.
# The first six people on the waiting list will be hired
# in the order that they are on the waiting list.
# The first six people will keep position for three months.
# At the end of three months,
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.
require_relative './Stack.rb'
require_relative './Queue.rb'

module Job
  class Simulation
    attr_reader  :waiting_list, :hires, :months
    def initialize(waiting_list, hires, months = 0)
      @waiting_list = Queue.new#first in, first out
      @hires = Stack.new#last in, first out
      @months = months
    end

    def deploy_first_hires
      @waiting_list = [7,8,9,10,11,12,13,14,15,16]
      employee = 1
      if @hires.empty? == true
        6.times do
          @hires.push.employee
          employee += 1
        end
      end
      puts @hires.to_s
      puts @waiting_list.to_s
      return @hires
    end

    def waiting
      return @waiting_list.size
    end

    def dice
      dice = [1, 2, 3, 4, 5, 6].sample
      return dice
    end

    def old_out_new_in
        dice.times do
        @hires.push(@waiting_list.pop)
        end
      puts "There are #{@waiting_list} waiting for employment."
      puts "There are #{@hires} currently hired."
    end


    def three_months?
      @months += 1
      if @months == 3
        reset_time
      end
    end

    def reset_time
      @months = 0
    end

    ##simulation##
    go = Job::Simulation.new(15,6)

    puts "Aardvarc Ad Co. Hiring Approach Solutions"
    puts
    puts "You havepeople waiting for a job, and currently, there are 6 open positions!"

    3.times do
      puts go.deploy_first_hires
      puts go.dice
      puts go.old_out_new_in
      puts go.three_months?
      puts go.deploy_first_hires
      puts go.dice
      puts go.old_out_new_in
      puts go.three_months?
      puts go.deploy_first_hires
      puts go.dice
      puts go.old_out_new_in
      puts go.three_months?
    end
    puts @waiting_list
  end
end
