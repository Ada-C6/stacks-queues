require './Stack.rb'
require './Queue.rb'

waitingQueue = Queue.new
employeeStack = Stack.new

play = true

def printQueue(waitingQueue)
  waitingQueue.size.times do |x|
    puts "Waiting Queue ID: #{waitingQueue.front}"
    waitingQueue.enqueue(waitingQueue.dequeue)
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

firstRun = true
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

  if firstRun == true
    puts "\nInitial Waiting List: "
    printQueue(waitingQueue)

    genEmployeeList(waitingQueue, employeeStack, 6)

    puts "\nWe were able to hire 6 people!\n\nHired List: "
    printStack(employeeStack)
    firstRun = false

    puts "\nRemaining Waiting List: "
    printQueue(waitingQueue)

  else
    puts "\nUpdated Waiting List: "
    printQueue(waitingQueue)

    puts "\nStarting Employee List: "
    printStack(employeeStack)
  end

  die = rand(1..6)
  puts "\nAfter Three Months -------- The Manager Rolls the Die = #{die}\n\n"

  die.times do
      puts "Employee ID: #{employeeStack.top} is fired."
      waitingQueue.enqueue(employeeStack.pop)
  end

  genEmployeeList(waitingQueue, employeeStack, die)

  puts "\nWe were able to hire #{die} people!\n\nUpdated Employee List: "
  printStack(employeeStack)

  puts "\nRemaining Waiting List: "
  printQueue(waitingQueue)

  puts "\nDo you need another round of Hire/Fire? "
  userChoice = gets.chomp.downcase
  if userChoice == "yes" || userChoice == "y"
    play = true
  else
    play = false
  end
end
