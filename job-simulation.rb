# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide that in order to give
# more people an opportunity to make money they will allow people to work in
# three-month intervals. The first six people on the waiting list (queue) will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired (stack).  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

require './Stack.rb'
require './Queue.rb'
require 'faker'

#To add the to_s method to the Stack class
#This will make it print out a numbered list of the elements in the stack
class Stack
	def to_s
		stringy=""
		keep=[]
		num_elements=self.size
		num_elements.times do |i|
			keep<<self.top
			element=self.pop
			stringy.prepend("#{num_elements-i}. #{element}\n")
		end
		#put the stack back the way it was
		keep.reverse.each {|element| self.push(element)}
		return stringy
	end
end

#To add the to_s method to the Queue class
#This will make it print out a numbered list of the elements in the stack
class Queue
	def to_s
		stringy=""
		keep=[]
		num_elements=self.size
		num_elements.times do |i|
			keep<<self.front
			element=self.dequeue
			stringy<<"#{i+1}. #{element}\n" 
		end
		#put the queue back the way it was
		keep.each {|element| self.enqueue(element)}
		return stringy
	end
end


module JobSim
	class Company
		attr_reader :waiting_list, :employees_hired
		def initialize(potentials)
			#an instance of company must be initialized with 12 or more potential employees or else program will throw error
			raise ArgumentError, "You must have at least 12 potential employees to start a company" unless potentials.length >=12
			#The waiting list is a queue. The first person on the list is the first person off the list
			@waiting_list=Queue.new
			#all potential employees are added to the waiting list
			add_people_to_waitlist(potentials)
			#The list of employees hired is a stack. The last person on the list (hired) is the first person off (fired)
			@employees_hired=Stack.new
			#the first six people on the waiting list are hired
			6.times{hire_employee} 
		end

		#pick a random number between 1 and 6. Fire that many people, then hire that many
		def play_fire_lottery
			amount_to_fire=rand(1..6)
			puts "#{amount_to_fire} people will be fired"
			#employees are hired and potentials are fired in separate loops because
			#if it was done in one loop the person just hired in one iteration 
			#would be fired in the next iteration
			amount_to_fire.times{fire_employee}
			amount_to_fire.times{hire_employee}
		end

		#passed an array of people who are added to the waitlist one by one 
		def add_people_to_waitlist(people)
			people.each {|person| @waiting_list.enqueue(person)}	
		end
		
		#passed a single person who is enqueued to the end of the waitlist
		def add_person_to_waitlist(person)
			@waiting_list.enqueue(person)
		end

		#the person that is dequeued from the wait list is pushed onto the
		#employees hired list
		def hire_employee
			next_in_line=@waiting_list.front
			@employees_hired.push(@waiting_list.dequeue)
			puts "#{next_in_line.name.first} #{next_in_line.name.last} was hired"
		end
		#the person that is popped from the employees hired stack is enqueued to the 
		#waitlist
		def fire_employee
			last_hired=@employees_hired.top
			add_person_to_waitlist(@employees_hired.pop)
			puts "#{last_hired.name.first} #{last_hired.name.last} was fired"
		end
	end

	#class person represents a person with a last name and a first name
	#name is an array [first_name,last_name]
	#to accesss first name: name.first
	class Person
		attr_reader :name
		def initialize(name)
			@name=name 
		end
		#a class method which creates "number" number of people with faker-generated 
		#last names and first names.
		def self.create_people(number)
			people=[]
			number.times do 
				people<<Person.new([Faker::Name.first_name,Faker::Name.last_name])
			end
			return people
		end
		#to_s method returns a string of first name and last name
		def to_s
			return "#{name.first} #{name.last}"
		end
	end
end


people=JobSim::Person.create_people(18)
craze=JobSim::Company.new(people)

puts "\nInital Employees Hired"
puts "====================="
puts craze.employees_hired

puts "\nInitial Waiting List"
puts "===================="
puts craze.waiting_list

puts "\nTime for a fire lottery..."
craze.play_fire_lottery

puts "\nNew Waiting List"
puts "===================="
puts craze.waiting_list

puts "\nNew Employee List"
puts "====================="
puts craze.employees_hired
