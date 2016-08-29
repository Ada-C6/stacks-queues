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
    @roll_call = Stack.new
    @waiting_list = Queue.new
    people.each do |element|
      @waiting_list.enqueue(element)
    end

  end
  def hire(number_of_new_employees)
    employees = []
    number_of_new_employees.times do
      employee = waiting_list.dequeue
      roll_call.push(employee)
      employees << employee
    end
    return employees # array of those hired
  end

  def fire(number_of_employees_to_fire)
    staff_returned_to_waiting = []
    number_of_employees_to_fire.times do
      employee = roll_call.pop
      waiting_list.enqueue(employee)
      staff_returned_to_waiting << employee
    end
    return staff_returned_to_waiting # array of those employees just fired
  end

  def die_roll
    return rand(1..6)
  end
end#class
