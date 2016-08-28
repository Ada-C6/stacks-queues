class BadCompany
  attr_accessor :waiting_list, :employee_list

  def initialize
    @waiting_list = Queue.new
    @employee_list = Stack.new
  end

  def receive_applications(applicant_array)
    applicant_array.each do |applicant|
      waiting_list.enqueue(applicant) # add new applicant to waiting list (FIFO)
    end
    return waiting_list
  end

  def fool_turnover
    qty_firing = roll_dice
    puts "Dice roll is: " + qty_firing.to_s # @todo remove/debug
    fire(qty_firing)
    hire(qty_firing)
    return employee_list, waiting_list
  end

  def hire(quantity)
    # remove first waiters from waiting list & push into the employee list
    quantity.times do |hire|
      new_employee = waiting_list.dequeue
      puts "Hiring: #{ new_employee }"
      employee_list.push(new_employee)
    end
    return employee_list, waiting_list
  end

  def fire(quantity)
    # pop last employees off employee list & add to the end of waiting list
    quantity.times do |fire|
      fired_employee = employee_list.pop
      puts "Firing: #{ fired_employee }"
      waiting_list.enqueue(fired_employee)
    end
    return employee_list, waiting_list
  end

  def roll_dice
    return rand(1..6)
  end

end # BadCompany class
