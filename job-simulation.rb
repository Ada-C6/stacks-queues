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
require 'awesome_print'
#waiting list <-- stack or queue
#people hired <-- stack or queue

# class Stack
# 	def to_s
# 		stringy=""
# 		keep=[]
# 		num_elements=self.size
# 		num_elements.times do |i|
# 			keep<<self.top
# 			#you should be generalizing this for any stack element not for a person object
# 			person=self.pop
# 			stringy.prepend("#{i+1}. #{person.name.last},#{person.name.first}\n")
# 		end
# 		keep.reverse.each do |element|
# 			self.push(element)
# 		end
# 		return stringy
# 	end
# end

# class Queue
# 	def to_s
# 		stringy=""
# 		keep=[]
# 		num_elements=self.size
# 		num_elements.times do
# 			keep<<self.front
# 			person=self.dequeue
# 			stringy<<"#{person.name.last},#{person.name.first}\n" 
# 		end
# 		keep.each do |element|
# 			self.enqueue
# 		end
# 	end
# end



class Company
	attr_reader :waiting_list, :employees_hired
	def initialize(potentials=nil)
		@waiting_list=Queue.new
		add_people_to_waitlist(potentials)
		@employees_hired=Stack.new
		if potentials.length >=6
			6.times do 
				hire_employee
			end
		end
	end

	def play_fire_lottery
		amount_to_fire=rand(1..6)
		puts  amount_to_fire
		amount_to_fire.times do 
			fire_employee
		end
		amount_to_fire.times do
			hire_employee
		end
	end

	def add_people_to_waitlist(people)
		people.each do |person|
			@waiting_list.enqueue(person)
		end	
	end

	def add_person_to_waitlist(person)
		@waiting_list.enqueue(person)
	end

	def hire_employee
		@employees_hired.push(@waiting_list.dequeue)
		puts "Employees hired"
		ap @employees_hired
	end

	def fire_employee
		add_person_to_waitlist(@employees_hired.pop)
		puts "Employees hired"
		ap @employees_hired
	end
end

# class Person
# 	attr_reader :name
# 	def initialize(name)
# 	@name=name 
# 	end

# 	def self.create_people(number)
# 		people=[]
# 		number.times do 
# 			people<<Person.new([Faker::Name.first_name,Faker::Name.last_name])
# 		end
# 		return people
# 	end

# 	def to_s
# 		return "#{name.last},#{name.first}"
# 	end
# end

# s=Stack.new
# s.push("bob")
# s.push("jill")
# s.push("sue")
# puts s


#people=Person.create_people(12)
people=[]
12.times do
	people<< Faker::Name.first_name
end

craze=Company.new(people)
puts "Initial Waiting List"
puts "===================="
ap craze.waiting_list
puts "Inital Employees Hired"
puts "====================="
ap craze.employees_hired
puts "Time for a fire lottery..."
craze.play_fire_lottery
puts "People were fired"
puts "New Waiting List"
puts "===================="
ap craze.waiting_list
puts "New Employee List"
puts "====================="
ap craze.employees_hired

#make an arrary of employees (faker names)
#initialize company passing it array of employees
#test methods to see if they work out
