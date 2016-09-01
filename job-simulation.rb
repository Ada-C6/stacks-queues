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
