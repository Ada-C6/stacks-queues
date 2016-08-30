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

# I really really struggled with this. Not because of the stacks and queues, but because the instance variables @waitlist and @job_positions were both being read as nil class. Since they weren't being read as an array, I couldn't perform the predefined methods from the stack.rb or queue.rb file. I checked all the syntax and deleted the entire thing multiple times with no success. Hoepfully, this gives you a general sense of things dispite this.

class Jobs
  attr_accessor :waitlist, :job_positions

  def initialize(wait = 19, current = 6)
    @waitlist = Queue.new
    wait.times do
      # names are generated by Faker and enqueued into the waitlist
      m = Faker::Name.name
      @waitlist.enqueue(m)
    end

    @job_positions = Stack.new
    current.times do
      m = Faker::Name.name
      @job_positions.push(m)
    end
  end

  def rotation
    #hires is a local variable beacuse the value only matters when you are within this method.
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
end

omg = Jobs.new
puts omg.waitlist.size

# RUNNING THE CODE -
# Each time a three month period is up, rotation is called on the instance i = Jobs.new and new people come in and old people go out, depending on the roll of the dice.

# I have compared my code with Crystals code with no success. I feel that the format is all the same. I have instance variables which do essentially the same thing as hers but still no success. I spent a long time trying to work through the nil class issues before realizing I was deleting more than I was adding. I had many people also check it and they didn't see any major differences either.



  #
  # class Company
  #
  # end
  #
  # waitlist = Queue.new
  # job_positions = Stack.new
  #
  # # Creates a waitlist of 25 people
  # 25.times do
  #   m = Faker::Name.name
  #   waitlist.enqueue(m)
  # end
  #
  # puts waitlist.size
  #
  # # 6 times, remove someone from the waitlist and add them to the job positions.
  # 6.times do
  #   waitlist.dequeue
  #   job_positions.push(waitlist.front)
  # end
  #
  #
  # def three_month_rotation
  #   hires = rand(1..6)
  #
  #   hires.times do
  #     # enter people last hired onto waitlist
  #     waitlist.enqueue(job_positions.top)
  #     # remove people last hired at job. Must happen after entering onto waitlist or else the positions won't register onto waitlist.
  #     job_positions.pop
  #     # add the person first on the waitlist into a job opening.
  #     job_positions.push(waitlist.front)
  #     # remove person first on the waitlist
  #     waitlist.dequeue
  #   end
  # end
  #
  #
  #
  #
  #
  # puts waitlist.size
  # puts job_positions.size
  #
  #
  #
  # # A company has six hiring positions with more people wanting jobs than the
  # # number of available positions.  The company managers decide in order to give
  # # more people an opportunity to make money; they will allow people to work in
  # # three-month intervals. The first six people on the waiting list will be hired
  # # in the order that they are on the waiting list.  The first six people will
  # # keep these positions for three months.  At the end of three months, the
  # # manager will roll a dice to determine the number of people who will lose their
  # # jobs. The company will use the policy of last-hired-first-fired.  For example,
  # # if the dice roll is 3, the last 3 people hired will lose their jobs to the
  # # first 3 people on the waiting list. People losing their jobs will be placed on
  # # the back of the waiting list in the order that they are fired. This process
  # # will continue for every three-month interval.
  #
  # # require_relative 'Stack'
  # # require_relative 'Queue'
  # # require 'Faker'
  # #
  # # class Jobs
  # #   attr_accessor :waitlist, :job_positions
  # #
  # #   def initialize
  # #     @waitlist = Queue.new
  # #       # @waitlist.enqueue(Faker::Name.name)
  # #
  # #     @job_positions = Stack.new
  # #   end
  # #
  # #   puts @waitlist.class
  # #
  # #
  # # end
  # #
  # # m = Jobs.new
  # #
  # #
  # #
  # # # puts @waitlist.size
  # #
  # # # 19.times do
  # # #   i = Faker::Name.name
  # # #   @waitlist.enqueue(i)
  # # # end
  # # #
  # # # 6.times do
  # # #   m = Faker::Name.name
  # # #   @job_positions.enqueue(m)
  # # # end
  # #
  # # # puts @job_positions.si
  # # #
  # #
  # # #
  # # # 6.times do
  # # #   m = Faker::Name.name
  # # #   @job_positions.enqueue(m)
  # # # end
