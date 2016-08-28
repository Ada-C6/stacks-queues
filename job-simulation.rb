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

# Make a class for this workplace/company
# need waiting list and currenly working people

# (Push from our own clone)
# Push the change back to Ada C6 after we're done (Sunday night even if not working, then until Tuesday to fix)

# Slack Crystal questions if we have them

require_relative "stack"
require_relative "queue"
require_relative "hr"

puts
TempByDesignInc::HR.new
TempByDesignInc::HR.set_queue_stack
TempByDesignInc::HR.populate_waiting_list
TempByDesignInc::HR.waiting_list_confirmation
puts
TempByDesignInc::HR.hire_from_waiting_list(TempByDesignInc::HR.num_to_hire)
TempByDesignInc::HR.passage_of_3_months
TempByDesignInc::HR.fire_from_current
TempByDesignInc::HR.populate_waiting_list
TempByDesignInc::HR.hire_from_waiting_list(TempByDesignInc::HR.num_to_hire)
TempByDesignInc::HR.passage_of_3_months
TempByDesignInc::HR.fire_from_current
TempByDesignInc::HR.populate_waiting_list
TempByDesignInc::HR.hire_from_waiting_list(TempByDesignInc::HR.num_to_hire)
puts
