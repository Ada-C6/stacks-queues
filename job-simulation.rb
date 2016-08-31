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
class Job

#The two groups are initialized here
def initialize
  @employed = Stack.new
  @temp = Queue.new

end

#This helps to set the groups
def set_places(arry_a, arry_b)
arry_a.each do |i|
  @employed.push(i)
end
arry_b.each do |i|
  @temp.enqueue(i)
end
  return @employed, @temp
end

# Roll dice method sets the amount of people hired and fired and moves them accordingly
# The respective groups are added to the end of the other group
def roll_dice
  fired_peeps = " "
  new_hires = " "
  dice = rand(1..5) + 1
  puts "Boss rolled #{dice}:"
  puts "List of fired \t\t List of Hired"
  dice.times do
  fired_peeps = @employed.pop
  new_hires = @temp.dequeue
  puts "#{fired_peeps} \t\t\t\t #{new_hires}"
  @employed.push(new_hires)
  @temp.enqueue(fired_peeps)
end
end

end

iit = Job.new_hires
lucky_people = %w(a b c d e f)
other_folks  = %w(g h i j k l m n o p q r s)
iit.set_places(lucky_people, other_folks)
iit.roll_dice
iit.roll_dice
iit.roll_dice
