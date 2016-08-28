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

  # I'm not 100% sure i need this method, but whenever I try to just use dequeue things break in a way that is very confusing. ROLLING WITH IT
  def append_to_waitlist(number_to_add, list_of_people)
    number_to_add.times do |person|
      @people_on_list << list_of_people[person]
    end
    return @people_on_list
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

  # takes an argument for number of people, takes them from the hopefuls Queue, adds them to the
  def hire(number_of_spots, people_to_hire)
    number_of_spots.times do
      @people_with_jobs.push(people_to_hire.dequeue)
    end
  end

  def fire(number_of_spots)
    fired_people = []
    number_of_spots.times do |person|
      fired_person = @people_with_jobs.pop
      fired_people << fired_person
    end
    return fired_people
  end

   def to_s
    return "these people have jobs: #{@people_with_jobs.join(", ")}"
   end
end

hopefuls = ["Fred", "Jamie", "Kevin", "Roberta", "PJ",
  "Alexandra", "Marc", "Tracy", "Kaneesha", "Yulia",
  "Todd", "Norbert", "Caroline"]

total_spots = 6

# creates new empty Stack of jobs for Q1
first_quarter = JobList.new

# creates new empty Queue of people who want jobs in Q1
waitlist = WaitList.new
# adds all hopefuls to waitlist, prints it.
waitlist.append_to_waitlist(hopefuls.length, hopefuls)
puts "Job list and wait list created."
puts "****************"
#### FIRST QUARTER
# hires 6 people from waitlist
first_quarter.hire(total_spots, waitlist)
puts "In the first quarter, #{first_quarter}."

# rolls die and saves it as q1 number of people to fire and rehire
q1_number = Die.new.roll
# fires q1 number of people and returns an array of them, then prints the results
fired_people = first_quarter.fire(q1_number)
fired_people.each do |person|
  puts "#{person} has been fired."
end

# updates and prints the wait list.
waitlist.enqueue(fired_people)
puts waitlist

# hires for the remaining spots and renames the list second_quarter
first_quarter.hire(q1_number,waitlist)
second_quarter = first_quarter
puts "For the second quarter, #{second_quarter}."

puts "************"

q2_number = Die.new.roll
puts "q2 number is #{q2_number}"

fired_people = second_quarter.fire(q2_number)
fired_people.each do |person|
  puts "#{person} has been fired."
end


waitlist.enqueue(fired_people)
puts waitlist

# puts "to test, second q after people are fired - #{second_quarter}"

###ughhhh this is broken in a really weird way and it won't work if I use the q2 variable
# AND NOBODY KNOWS WHY
# so we will try to figure that out later
second_quarter.hire(1, waitlist) # 1 is hard-coded bc q2_number fucks up the whole thing
third_quarter = second_quarter
puts third_quarter
# puts "For the third quarter, #{third_quarter}."

puts "************"
