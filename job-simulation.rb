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

class CrazyCompany

  def initialize (waiting = 15, workers = 6)
    #create queue pattern waitlist
    @waitlist = Queue.new
    #create initial waitlist
    waiting.times do |i|
      @waitlist.enqueue("E#{i+1}")
    end

    #create stack pattern list of employees
    @employees = Stack.new
    #create employee list based on waitlist
    workers.times do
      @employees.push(@waitlist.dequeue)
    end
    puts "Welcome to our company!
    Here is our current waitlist: #{@waitlist.store}
    Here is our current list of employees: #{@employees.store}"

  end

  def quarter
    #random dice toss
    dice = rand(6) + 1
    puts "May the odds be ever in your favor. The roll is #{dice}.\n\n"

    #fire employees
    dice.times do
      @waitlist.enqueue(@employees.pop)
    end

    #hire employees
    dice.times do
      @employees.push(@waitlist.dequeue)
    end

    puts "This quarter's waitlist: #{@waitlist.store}\n This quarter's employees: #{@employees.store}"

  end

end

dystopia = CrazyCompany.new

print "Roll the dice to start a new quarter?(y/n):"
new_quarter = gets.chomp.downcase
while true
  if new_quarter == "y"
    dystopia.quarter
  else
    exit
  end
  print "Roll the dice to start a new quarter?(y/n):"
  new_quarter = gets.chomp.downcase
end
