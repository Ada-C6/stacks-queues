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
require 'faker'

class Company
  attr_accessor :waitlist, :roster

  def initialize
    @waitlist = Queue.new
    12.times do
      waitlist.enqueue(Faker::Name.name)
    end
    @roster = Stack.new
  end

  def first_hire
    6.times do
      @roster.push(@waitlist.dequeue)
    end
  end

  def fire_hire
    die = Random.new.rand(1..6)
    die.times do
      @waitlist.enqueue(@roster.pop)
    end
    die.times do
      @roster.push(@waitlist.dequeue)
    end
    return die
  end

  def print_waitlist
    puts @waitlist.print
  end

  def print_roster
    puts @roster.print
  end
end

temp_agency = Company.new
puts "This is the original waitlist: "
puts temp_agency.print_waitlist
puts "There is currently no one on the roster."
puts "Let's hire the first 6 employees: "
temp_agency.first_hire
puts "This is the current company roster for temp employees: "
puts temp_agency.print_roster
puts "Let's see how the waitlist looks: "
puts temp_agency.print_waitlist
puts "It has been 3 months, let's roll the die."
puts "We have to fire/hire #{temp_agency.fire_hire} people."
puts "This is the new current company roster: "
puts temp_agency.print_roster
puts "This is the new waitlist: "
puts temp_agency.print_waitlist
puts "It has been 3 months, let's roll the die."
puts "We have to fire/hire #{temp_agency.fire_hire} people."
puts "This is the new current company roster: "
puts temp_agency.print_roster
puts "This is the new waitlist: "
puts temp_agency.print_waitlist
