require './Stack.rb'
require './Queue.rb'
class AssociatesCooperation
  attr_accessor :roll_call, :waiting_list #, :employee_roll_call, :employee_waiting_list
  def initialize
    people = [
      'Ada',
      'Bodil',
      'Charlotta',
      'Didrik',
      'Enrico',
      'Fredrik',
      'Gerd',
      'Holger',
      'Ilse',
      'Josefine',
      'Klara',
      'Lizette'
    ]
    @employee_roll_call = []
    @employee_waiting_list = []
    @roll_call = Stack.new
    @waiting_list = Queue.new
    people.each do |element|
      @waiting_list.enqueue(element)
      @employee_waiting_list << element
    end

  end
  def hire(number_of_new_employees)
    number_of_new_employees.times do
      employee = waiting_list.dequeue
      @employee_waiting_list.shift
      roll_call.push(employee)
      @employee_roll_call << employee
    end
    return @employee_roll_call
  end

  def fire(number_of_employees_to_fire)
    number_of_employees_to_fire.times do
      employee = roll_call.pop
      @employee_roll_call.pop
      waiting_list.enqueue(employee)
      @employee_waiting_list << employee
    end
    return @employee_waiting_list
  end

  def die_roll
    return rand(1..6)
  end

  def company_roll_call
    #some code here
    return @employee_roll_call
  end
  def company_waiting_list
    #some code here
    return @employee_waiting_list
  end
end#class
