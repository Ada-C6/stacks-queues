# @note 1)  Overwhelmed at the objectives of assignment (bulk of text) but dissassembled
# @note     by writing tests of the functionality.
# @note 2)  Considered expanding the Stack and Queue classes with methods to list all
# @note     in the arrays,
# @todo     but instead I plan to test that the stacks and the queue does it

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



require_relative 'tests_stack_queue'
#require_relative 'associates_co'

my_tests = TestsStackQueue.new
my_tests.run_tests
def company_hiring
  the_company = AssociatesCooperation.new
  puts "It is the start of the hiring cycle and HR goes out to hire six employees off the waiting list."
  the_company.hire(6)
  puts "They work very hard for three months. But it is time to shift workers."
end
