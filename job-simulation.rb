# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first SIX people on the waiting list will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.
#
# Due Sunday evening, but probably won't be examined until Tuesday. Turn in by
# committing it, pushing it, and doing a PR (pull request). Push it on Sunday
# even if it's not done. Push to Ada-C6, which will be the default when we do it.
# Include some kind of info including our name in the comment for the pull request.

require './Stack.rb'
require './Queue.rb'

class CrazyCompany

  NUM_EMPLOYEES = 6
  MIN_FIRED = 1
  MAX_FIRED = 6

  attr_accessor :waiting_list, :current_employees

  def initialize(potential_workers)

    @waiting_list = Queue.new
    @current_employees = Stack.new

    potential_workers.each do |worker|
      @waiting_list.enqueue(worker)
    end

    # puts @waiting_list.inspect

    NUM_EMPLOYEES.times do
      worker = @waiting_list.dequeue
      @current_employees.push(worker)
    end

    # puts @waiting_list.inspect
    # puts @current_employees.inspect

  end

  def self.roll_dice
    return Random.rand(MIN_FIRED..MAX_FIRED)
  end

  def remove_employees(num)

    num.times do
      fired_person = @current_employees.pop
      @waiting_list.enqueue(fired_person)
    end

  end

  def add_employees(num)

    num.times do
      hired_person = @waiting_list.dequeue
      @current_employees.push(hired_person)
    end

  end

end

crazy_copy_editing_company = CrazyCompany.new(["Virginia Woolf", "J. D. Salinger", "William Shakespeare", "Chimamanda Ngozi Adichie", "Eduardo Galeano", "Jorge Luis Borges", "Isabel Allende", "Rebecca Skloot", "Gabriel Garcia Marquez", "Chinua Achebe", "Sandra Cisneros", "John Varley", "Robert A. Heinlein"])

puts "INITIAL ROUND OF HIRING...\n\n"
puts "Current employees: \n\n" + crazy_copy_editing_company.current_employees.to_s
puts "\n"
puts "Waiting list: " + crazy_copy_editing_company.waiting_list.to_s
puts "\n"

while(true)

  puts "THREE MONTHS PASS...\n\n"

  turnover = CrazyCompany.roll_dice

  puts "Number of people to fire and hire: #{turnover}"

  crazy_copy_editing_company.remove_employees(turnover)
  crazy_copy_editing_company.add_employees(turnover)

  puts "After the firing and hiring, the current employees are:\n\n"
  puts crazy_copy_editing_company.current_employees.to_s
  puts "\n"
  puts "Waiting list: " + crazy_copy_editing_company.waiting_list.to_s
  puts "\n"

  valid_answer = false

  while (!valid_answer)
    print "Continue the madness? (Y/N) "

    answer = gets.chomp.strip.downcase

    if answer == "n"
      valid_answer = true
      exit
    elsif answer == "y"
      valid_answer = true
    else
      puts "Sorry, I didn't get that, please try again."
    end

  end

end
