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

class Crazy_Hospital
  attr_reader :initial_drs, :drs_hired, :drs_list

  def initialize
    @initial_drs = ["Meridith Grey",
    "Derek Sheperd",
    "Christina Yang",
    "Arizona Robbins",
    "Calliope Torres",
    "Mark Sloan",
    "Benjamin Warren",
    "Alex Karev",
    "Nathan Riggs",
    "Lexi Grey",
    "Jo Wilson",
    "Miranda Bailey",
    "Stephanie Edwards",
    "Owen Hunt",
    "Jackson Avery",
    "Richard Webber",
    "April Kepner",
    "Amelia Sheperd",
    "Maggie Pierce",
    "Andrew Deluca"]
    @drs_hired = Stack.new
    @drs_list = Queue.new
  end

  def adding_first_drs
    @initial_drs.each do |dr|
      @drs_list.enqueue(dr)
    end
  end

  def hired(num = 6)
    num.times do |d|
      add_dr = @drs_list.dequeue
      @drs_hired.push(add_dr)
    end
    return @drs_hired
  end

  def three_months
    fired_num = rand(6) + 1
    fired_num.times do |d|
      last_dr = @drs_hired.pop
      @drs_list.enqueue(last_dr)
      puts "firing: #{last_dr}"
    end
    puts ""
    fired_num.times do |d|
      add_dr = @drs_list.dequeue
      @drs_hired.push(add_dr)
      puts "hiring: #{add_dr}"
    end
    puts ""
    return @drs_hired
  end
end

#create instance
greys_anatomy = Crazy_Hospital.new

#add drs to waitlist
p greys_anatomy.adding_first_drs

#hire first six drs
p greys_anatomy.hired(6)

#hire & fire
p greys_anatomy.three_months

#hire & fire
p greys_anatomy.three_months
