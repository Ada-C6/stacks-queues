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
require 'awesome_print'

class CrazyCompany
  attr_accessor :wait
  @@waiting_list = ["joe", "nancy", "simon", "alex", "andy", "ashlee", "hannah", "jessica", "george", "kit", "hubert", "Emma"]
  def create_original_wait_list
    @wait = Queue.new
    @@waiting_list.each do |i|
      @wait.enqueue(i)
    end
  end
  def create_original_hire
    @hire = Stack.new
    6.times do
        @hire.push(@wait.dequeue)
      end
  end
  def roulette
    layoff = rand(1..6)
    puts "#{layoff} layoff(s) will occur this term."
    layoff.times do
      @wait.enqueue(@hire.pop)
    end
    layoff.times do
      @hire.push(@wait.dequeue)
    end
    ap "Three months later..."
    ap "Wait list is #{@wait.to_s}"
    ap "Current employees are #{@hire.to_s}"
  end
end


new1 = CrazyCompany.new
ap new1.create_original_wait_list
ap new1.create_original_hire
new1.roulette
new1.roulette
new1.roulette

#store waiting list (queue) and people hired/fired (stack)

#due: Sunday evening - won't be looked at until Tuesday
#push button 'new pull request' to turn in...
