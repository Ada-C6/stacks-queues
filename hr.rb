require "faker"
require_relative "dice"
module TempByDesignInc
  class HR
    attr_accessor :waiting_list, :current_non_manag_employees
    def initialize
      @waiting_list = waiting_list
      @current_non_manag_employees = current_non_manag_employees
    end

    # I feel like there must be a better way to accomplish assigning these instance variables to a new Queue/Stack, but my other attemps errored and this is the solution that worked
    def self.set_queue_stack
      @waiting_list = Queue.new
      @current_non_manag_employees = Stack.new
    end

    # This is one of several methods where I'd realized I could be more DRY by creating methods for puts strings I was repeating
    def self.waiting_list_confirmation
      if @waiting_list.empty? == true
        puts "There is no one on the waiting list right now."
      else
        print "Current Waitlist: "
        puts "#{ @waiting_list.values_to_s }"
      end
    end

    def self.current_non_manag_employees_confirmation
      if @current_non_manag_employees.empty? == true
        puts "There are no non-management employees right now."
      else
        print "Current Non-Management Employees: "
        puts "#{ @current_non_manag_employees.values_to_s }"
      end
    end

    def self.passage_of_3_months
      puts "(3 months pass)"
      puts
    end

    def self.populate_waiting_list
      while @waiting_list.empty?
        10.times do
          # I used faker's first_name + last_name functionalities because their name functionality included words like "Miss";
          # I wanted consistently formatted data
          @waiting_list.enqueue(Faker::Name.first_name + " " + Faker::Name.last_name)
        end
      end
      return @waiting_list
    end

    def self.num_to_hire
      num_to_hire = (6 - @current_non_manag_employees.size)
      return num_to_hire
    end

    def self.hire_from_waiting_list(number_of_hires)
      puts "HIRING FROM THE WAITLIST"
      number_of_hires.times do
        @current_non_manag_employees.push(@waiting_list.dequeue)
      end
      self.current_non_manag_employees_confirmation
      self.waiting_list_confirmation
      puts
      return @current_non_manag_employees
    end

    def self.fire_from_current
      puts "FIRING OF CURRENT NON-MANAGEMENT EMPLOYEES"
      number = TempByDesignInc::Dice.roll
      if number > 1
        puts "Managemnt has rolled the dice, and #{ number } employees will be fired."
      else
        puts "Managemnt has rolled the dice, and #{ number } employee will be fired."
      end
      number.times do |i|
      @waiting_list.enqueue(@current_non_manag_employees.pop)
      end
      self.current_non_manag_employees_confirmation
      self.waiting_list_confirmation
      puts
      return @current_non_manag_employees.size
    end

  end
end
