require_relative './Stack.rb'
require_relative './Queue.rb'
require 'awesome_print'

class ProbablyComcast

  attr_reader :working, :waitlisted

  def initialize(ppl_working = 6, ppl_waitlisted = 12)
    @working = Stack.new
    @waitlisted = Queue.new

    ppl_working.size do |index|
      @working << (index + 1)
    end

    ppl_waitlisted.size do |index|
      @waitlisted.enqueue(index + 1)
    end

  end

  def next_quarter
    die = Random.rand(1..6)

    die.times do

      fired = @working.pop
      ap "Workers fired: #{fired}"
      @waitlisted.enqueue(fired)

      hired = @waitlisted.dequeue
      ap "Waitlisted hired: #{hired}"
      @working.push(hired)
    end

    # hired = @waitlisted.enqueue(@working.top(die))
    #fired = @working << (@waitlisted.dequeue(die))
    # ^ didn't work

  end

end

recession = ProbablyComcast.new(6,12)
recession.next_quarter

# I don't know why this isn't working.
