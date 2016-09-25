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


require_relative './Stack.rb'
require_relative './Queue.rb'
require 'awesome_print'

class ProbablyComcast

  attr_reader :working, :waitlisted

  def initialize(ppl_working = 6, ppl_waitlisted = 12)
    @working = Stack.new
    @waitlisted = Queue.new

    ppl_working.times do |index|
      @working.push(index + 1)
    end
    #
    ppl_waitlisted.times do |index|
      @waitlisted.enqueue(index + 7)
    end

  end

  def next_quarter
    die = Random.rand(1..6)
    die.times do

      fired = @working.pop
      ap "Workers fired: #{fired}"
      @waitlisted.enqueue(fired)
    end

    die.times do

      hired = @waitlisted.dequeue
      ap "Waitlisted hired: #{hired}"
      @working.push(hired)
    end
  end

end

recession = ProbablyComcast.new(6,12)
recession.next_quarter
# puts recession.working.inspect
# puts recession.waitlisted.inspect
#
# puts recession.next_quarter
#
# puts recession.working.inspect
# puts recession.waitlisted.inspect
