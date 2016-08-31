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

class Company
  attr_reader :avail_jobs, :waitlist
  def initialize(num_jobs = 6, num_waiting = 10)
    @avail_jobs = Stack.new
    @waitlist = Queue.new
  end

  def month_count
    month_count = 0
    month_count += 1
    return month_count
  end

  def roll_dice
    dice = rand(1..6)
    return dice
  end

  def change_out
    month_count
    if month_count % 3 ==0
      roll_dice.times do
        @avail_jobs.pop
        @waitlist.dequeue
      end
      else
      puts "No staff changes this month"
    end
  end
end
