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
require 'Faker'

class Company

end

waitlist = Queue.new
job_positions = Stack.new

# Creates a waitlist of 25 people
25.times do
  m = Faker::Name.name
  waitlist.enqueue(m)
end

puts waitlist.size

# 6 times, remove someone from the waitlist and add them to the job positions.
6.times do
  waitlist.dequeue
  job_positions.push(waitlist.front)
end


def three_month_rotation
  hires = rand(1..6)

  hires.times do
    # enter people last hired onto waitlist
    waitlist.enqueue(job_positions.top)
    # remove people last hired at job. Must happen after entering onto waitlist or else the positions won't register onto waitlist.
    job_positions.pop
    # add the person first on the waitlist into a job opening.
    job_positions.push(waitlist.front)
    # remove person first on the waitlist
    waitlist.dequeue
  end
end





puts waitlist.size
puts job_positions.size
