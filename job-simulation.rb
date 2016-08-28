# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals.
#
# The first six people on the waiting list will be hired in the order that they are on the waiting list.
# The first six people will keep these positions for three months.
# At the end of three months, the manager will roll a dice to determine the number of people who will lose their jobs.
# The company will use the policy of last-hired-first-fired.
#
# For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

# due Sunday night

require './Stack.rb'
require './Queue.rb'

class HiringPolicy
  attr_accessor :hire, :waitlist, :hire_fire_roll, :current_hires, :waiting_list, :dice_roll

  def initialize
    @current_hires = Stack.new
    @waiting_list = Queue.new
    @dice_roll = rand(1..6)
  end

  def hire(person)
    @current_hires.push(person)
  end

  def waitlist(person)
    @waiting_list.enqueue(person)
  end

  def hire_fire_roll
    @dice_roll.times do
      fired_people = @current_hires.pop
      # puts "list of fired people #{fired_people}"   # Used to check that everything was working right
      @waiting_list.enqueue(fired_people)
    end
    @dice_roll.times do
      hired_people = @waiting_list.dequeue
      # puts "list of hired people #{hired_people}"   # Used to check that everything was working right
      @current_hires.push(hired_people)
    end
  end
end

# c = HiringPolicy.new
#
# c.hire("A")
# c.hire("B")
# c.hire("C")
# c.hire("D")
# c.hire("E")
# c.hire("F")
# c.waitlist("G")
# c.waitlist("H")
# c.waitlist("I")
# c.waitlist("J")
# c.waitlist("K")
# c.waitlist("L")
# puts "#{c.dice_roll}"
# c.hire_fire_roll
# puts "current hire: #{c.current_hires.inspect}"
# puts "waiting_list: #{c.waiting_list.inspect}"
