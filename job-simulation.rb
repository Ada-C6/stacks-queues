require './Stack.rb'
require './Queue.rb'

waitingQueue = Queue.new
employeeStack = Stack.new

play = true

def printQueue(waitingQueue)
  waitingQueue.size.times do |x|
    puts "Waiting Queue ID: #{waitingQueue.show(x)}"
  end
end

def printStack(employeeStack)
  6.times do |x|
      puts "Employee ID: #{employeeStack.show(x)}"
  end
end

def genEmployeeList(waitingQueue, employeeStack, num)
  num.times do
      employeeStack.push(waitingQueue.dequeue)
  end
end

puts "Welcome to the Hire/Fire program!"

while play
  puts "\nHow many people need jobs? "
  jobSeekers = gets.chomp.to_i
  while jobSeekers < 6 || jobSeekers > 100
    puts "Please enter a number greater than 6 and less than 20: "
    jobSeekers = gets.chomp.to_i
  end

  jobSeekers.times do
    waitingQueue.enqueue(rand(100..999))
  end

  puts "\nInitial Waiting List: "
  printQueue(waitingQueue)

  genEmployeeList(waitingQueue, employeeStack, 6)

  puts "\nHired List: "
  printStack(employeeStack)

  puts "\nWaiting List: "
  printQueue(waitingQueue)

  die = rand(1..6)
  puts "\nAfter Three Months -------- Dice roll = #{die}\n\n"

  die.times do
      puts "Employee ID: #{employeeStack.top} is fired."
      waitingQueue.enqueue(employeeStack.pop)
  end

  genEmployeeList(waitingQueue, employeeStack, die)

  puts "\nEmployee List: "
  printStack(employeeStack)

  puts "\nWaiting List: "
  printQueue(waitingQueue)

  puts "\nDo you need another round of Hire/Fire? "
  userChoice = gets.chomp.downcase
  if userChoice == "yes" || userChoice == "y"
    play = true
  else
    play = false
  end
end
