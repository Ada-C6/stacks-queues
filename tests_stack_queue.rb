#This program demands manual handling of three-month cycles
require_relative 'associates_co'

  class TestsStackQueue
    #Test that the first five/six? people on the waiting list are hired
    def test_hire_six
      test_company = AssociatesCooperation.new
      test_company.hire(6) # six open positions at start
      number_of_employees_in_company = test_company.roll_call.size
      if number_of_employees_in_company == 6
        puts "Test successful. They have hired six employees."
        return true
      else
        puts "Test failed. Number of employees were never six."
        return false
      end
    end
    def test_fire
      test_company = AssociatesCooperation.new
      test_company.hire(6)
      test_company.fire(1)
      number_of_employees_in_company = test_company.roll_call.size
      if number_of_employees_in_company == 5
        puts "Test successful. They fired one employee."
        return true
      else
        puts "Test failed. HR department failed at firing."
        return false
      end
    end
    #Test that die roll rolls
    #Test that die roll fired the right number of people
    def test_die_roll
      test_company = AssociatesCooperation.new
      test_company.hire(6) # six open positions at start
      employees_before = test_company.roll_call.size
      number_of_employees_to_fire = test_company.die_roll
      test_company.fire(number_of_employees_to_fire)
      employees_after = test_company.roll_call.size
      if employees_after == (employees_before - number_of_employees_to_fire)
        puts "Test successful: The company fired the number of people that the die roll determined."
        return true
      else
        puts "Test failed: The company did not fire the employees as planned."
        return false
      end
    end
    #Test that last-hired-first-fired
    # @todo don't know how fire will look yet or how to get the employee at the end of waiting list
    # @todo or the employee popped off the method: fire
    def test_last_hired_first_fired
      skip
      test_company = AssociatesCooperation.new
      test_company.hire(6) # six open positions at start
      test_company.roll_call.top
      test_company.fire(1)
      # Need a way to show who is on the roll_call
    end
    #Test that employee moves to back of waiting list when fired
    def test_waiting_list
      skip
      # @todo don't know yet how to list waiting list
      # @todo original plan was just to have a waitinglist queue and only next is available to view

    end
    def run_tests
      test_hire_six
      test_fire
      test_die_roll
      #test_last_hired_first_fired
      #test_waiting_list_order
    end
  end #class
