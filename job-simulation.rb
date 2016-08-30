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
require '../../week-2/dice.rb'

# class Waitlist is a queue of people who are currently trying to get jobs.
class WaitList < Queue
  def initialize
    super
    @people_on_list = @store
  end

  # let's print this stuff so we can see it nicely
  def to_s
   return "These people are on the waitlist: #{@people_on_list.join(", ")}"
  end
end

# class JobList is a stack of people who have jobs currently.
class JobList < Stack
  def initialize
    super
    @people_with_jobs = @store
  end

   def to_s
    return "these people have jobs: #{@people_with_jobs.join(", ")}"
   end

end

hopefuls = ["Fred", "Jamie", "Kevin", "Roberta", "PJ",
  "Alexandra", "Marc", "Tracy", "Kaneesha", "Yulia",
  "Todd", "Norbert", "Caroline"]
TOTAL_SPOTS = 6

# creates new empty Stack of jobs for Q1
employed_people = JobList.new
# creates new empty Queue of people who want jobs in Q1
waitlist = WaitList.new
# adds all people to the waitlist
hopefuls.each do |person|
  waitlist.enqueue(person)
end

# hires 6 people from waitlist
TOTAL_SPOTS.times do
  employed_people.push(waitlist.dequeue)
end
puts "In the first quarter, #{employed_people}."

while true
  puts "Would you like to fire and hire? Y/N"
  continue = gets.chomp.downcase
  if continue == "n"
    exit
  end

  # rolling a die and printing how many people will be fired
  number = Die.new.roll
  puts "#{number} people will be fired.\n"

  # firing people!
  fired_people = []
  number.times do
    fired_people << employed_people.pop
  end

  # # updates and prints the wait list.
  fired_people.each do |person|
    puts "#{person} has been fired.\n"
    waitlist.enqueue(person)
  end
  #

  puts "\n#{waitlist}"

  until employed_people.length == 6
    employed_people.push(waitlist.dequeue)
  end
  puts "\nFor this quarter, #{employed_people}"
end
